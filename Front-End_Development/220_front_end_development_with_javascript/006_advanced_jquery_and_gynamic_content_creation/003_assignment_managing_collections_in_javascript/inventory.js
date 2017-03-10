// inventory.js

var inventory;

(function() {
  inventory = {
    collection: [],
    template: "",
    currentId: 0,
    deleteItem: function(id) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== id
      });
    },
    findItemId: function($obj) {
      return + $obj.closest("tr").find("input[type='hidden']").val();
    },
    modifyCollectionItem: function(id, key, value) {
      this.collection.map(function(item) {
        return item.id === id ? item[key] = value : item;
      })
    },
    setDate: function() {
      var $orderDate = $("#order_date");
      $orderDate.text(new Date().toUTCString());
    },
    bindEvents: function() {
      $("#add_item").click(function(e) {
        e.preventDefault();
        inventory.currentId += 1;
        var id = inventory.currentId;
        var template = inventory.template.replace(/ID/g, '' + id);
        var $tr = $(template);
        
        $("#inventory").append($tr);
        inventory.collection.push({
          id: id,
          name: "",
          stockNumber: "",
          quantity: 1
        });
      });
      
      $("#inventory").on("click", 'a', function(e) {
        e.preventDefault();
        var $a = $(e.target);
        var $tr = $a.closest("tr");
        var id = inventory.findItemId($a);
        
        inventory.deleteItem(id);
        $tr.remove();
      });
      
      $("#inventory").on('blur', 'input', function(e) {
        e.preventDefault();
        var $input = $(e.target);
        var id = inventory.findItemId($input);
        var key = $input.attr("name").match(/(name|stock|quantity)/)[0];
        var value = $input.val();
      
        if (key === "stock") {
          key = "stockNumber";
        }
        
        inventory.modifyCollectionItem(id, key, value);
      });
    },
    init: function() {
      this.setDate();
      this.template = $("#inventory_item").text();
      this.bindEvents();
    }
  };

})();

$(inventory.init.bind(inventory));