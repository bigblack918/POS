  <div class="headings altheading">
    <h2>
      查詢結果 ：${go100InstanceList?go100InstanceList.size():0} 筆
    </h2>
  </div>

  <div  style="height: 330px">
    <table width="100%" class="searchlist">
      <thead>
        <tr>
          <th width="5%">檢視</th>
          <th width="5%" >#</th>
          <th width="10%">編號</th>
          <th width="10%">姓名</th>
        </tr>
      </thead>
      <tbody>
      <g:each in="${go100InstanceList}" var="go100Instance" status="i">
        <tr>
          <td style="text-align:center" width="5%" ></td> 
          <td style="text-align:center" width="5%" >${i+1}</td>
          <td style="text-align:center" width="10%">${go100Instance?.id}</td>
          <td style="text-align:center" width="10%">${go100Instance?.name}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
