Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E824E9BD2
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 18:04:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03E21C5AB61;
	Mon, 28 Mar 2022 16:04:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F28C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 16:04:07 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDb0Q0019040;
 Mon, 28 Mar 2022 18:04:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=GfByWH16HHX6Qk4JcOZ8xKr3ZNJrNVrLjkb0U/vYg4g=;
 b=hjip0oLFdSqnernVPI2n7Bg0GFl08PFx7p2OdkK6Io7MiRBP6sdw7tnn9C8k4pg/Vzr5
 bhXMuUVEEahqmfqUnPZCgieZsj9Lo1k0eaqkP7PW0W9KQNzmyRzcDSaMlRfjRe7eX1wb
 72IlkBw1BJ9Y7vwa2J87HvRVRQfx+REznlBE6p1Cj/N++HxoBoxQ2dW/vuPs3Ji+eliH
 klgu+JgIcigIFERJIYUM3d0JQvB5gJX74SZZab9gEBKEENNToDOtc4SAR2ctRQeE5HnO
 FWR0IPlidlGexYmmBWTbbwN/XbU4tl9M0zkYZ/guoxxKSYABccwUXvJ75dLQ9tIFfaiM 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1s4p2scp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 18:04:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7ED1510002A;
 Mon, 28 Mar 2022 18:04:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 727C5237D94;
 Mon, 28 Mar 2022 18:04:04 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar
 2022 18:04:03 +0200
Message-ID: <aa09cfba-9f01-8735-6435-e99327f9f73e@foss.st.com>
Date: Mon, 28 Mar 2022 18:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
References: <20220328151023.v2.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
 <e6feec3a-ac67-be20-8da4-3e6631a453ff@gmx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <e6feec3a-ac67-be20-8da4-3e6631a453ff@gmx.de>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_07,2022-03-28_01,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] rng: add OP-TEE based Random
	Number Generator
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiAzLzI4LzIyIDE1OjI1LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+IE9uIDMv
MjgvMjIgMTU6MTEsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+IEFkZCBkcml2ZXIgZm9yIE9Q
LVRFRSBiYXNlZCBSYW5kb20gTnVtYmVyIEdlbmVyYXRvciBvbiBBUk0gU29Dcwo+PiB3aGVyZSBo
YXJkd2FyZSBlbnRyb3B5IHNvdXJjZXMgYXJlIG5vdCBhY2Nlc3NpYmxlIHRvIG5vcm1hbCB3b3Js
ZAo+PiBhbmQgdGhlIFJORyBzZXJ2aWNlIGlzIHByb3ZpZGVkIGJ5IGEgSFdSTkcgVHJ1c3RlZCBB
cHBsaWNhdGlvbiAoVEEpLgo+Pgo+PiBUaGlzIGRyaXZlciBpcyBiYXNlZCBvbiB0aGUgbGludXgg
ZHJpdmVyOiBjaGFyL2h3X3JhbmRvbS9vcHRlZS1ybmcuYwo+Pgo+PiBTZXJpZXNfY2hhbmdlczog
Mgo+PiAtIGNoYW5nZSBTUERYLUxpY2Vuc2UtSWRlbnRpZmllciwgYmVjYXVzZWUgIkdQTC0yLjAr
4oCdIGlzIG9ic29sZXRlCj4+IMKgwqAgcmVmZXJlbmNlOiBodHRwczovL3NwZHguZGV2L2lkcy8K
Pj4gLSB1cGRhdGUgS2NvbmZpZyBsb25nIGhlbHAgbWVzc2FnZSBhcyBwcm9wb3NlZCBieSBIZWlu
cmljaAo+PiAtIHJlcGxhY2UgbWVtc2V0KC4uLCAwLCBzaXplb2YoLi4pKSBieSBzdHJ1Y3QgaW5p
dGlhbGlzYXRpb24gKD0gezB9OykKPj4gLSBhZGQgZnVuY3Rpb24gZGVzY3JpcHRpb25zCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+Cj4+IC0tLQo+Pgo+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPj4KPj4gwqAgTUFJTlRB
SU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvcm5n
L0tjb25maWfCoMKgwqDCoCB8wqDCoCA5ICsrCj4+IMKgIGRyaXZlcnMvcm5nL01ha2VmaWxlwqDC
oMKgIHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL3JuZy9vcHRlZV9ybmcuYyB8IDE4MCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwg
MTkxIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcm5nL29w
dGVlX3JuZy5jCj4+Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+
IGluZGV4IGYyNWNhN2NkMDAuLjMzNTZjNjVkZDAgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJT
Cj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC00ODEsNiArNDgxLDcgQEAgRjrCoMKgwqAgZHJp
dmVycy9wb3dlci9yZWd1bGF0b3Ivc3RwbWljMS5jCj4+IMKgIEY6wqDCoMKgIGRyaXZlcnMvcmFt
L3N0bTMybXAxLwo+PiDCoCBGOsKgwqDCoCBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfY29wcm8u
Ywo+PiDCoCBGOsKgwqDCoCBkcml2ZXJzL3Jlc2V0L3N0bTMyLXJlc2V0LmMKPj4gK0Y6wqDCoMKg
IGRyaXZlcnMvcm5nL29wdGVlX3JuZy5jCj4+IMKgIEY6wqDCoMKgIGRyaXZlcnMvcm5nL3N0bTMy
bXAxX3JuZy5jCj4+IMKgIEY6wqDCoMKgIGRyaXZlcnMvcnRjL3N0bTMyX3J0Yy5jCj4+IMKgIEY6
wqDCoMKgIGRyaXZlcnMvc2VyaWFsL3NlcmlhbF9zdG0zMi4qCgoKKC4uLikKCj4+Cj4+ICsrKyBi
L2RyaXZlcnMvcm5nL29wdGVlX3JuZy5jCj4+IEBAIC0wLDAgKzEsMTgwIEBACj4+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlciBPUiBCU0QtMy1DbGF1c2UKPj4g
Ky8qCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIsIFNUTWljcm9lbGVjdHJvbmljcyAtIEFsbCBS
aWdodHMgUmVzZXJ2ZWQKPj4gKyAqLwo+PiArI2RlZmluZSBMT0dfQ0FURUdPUlkgVUNMQVNTX1JO
Rwo+PiArCgoKKC4uLikKCj4+Cj4+ICsKPj4gKy8qKgo+PiArICogb3B0ZWVfcm5nX3Byb2JlKCkg
LSBwcm9iZSBmdW5jdGlvbiBmb3IgT1AtVEVFIFJORyBkZXZpY2UKPj4gKyAqCj4+ICsgKiBAZGV2
OsKgwqDCoMKgwqDCoMKgIGRldmljZQo+PiArICogUmV0dXJuOsKgwqDCoMKgwqDCoMKgIDAgaWYg
b2sKPj4gKyAqLwo+PiArc3RhdGljIGludCBvcHRlZV9ybmdfcHJvYmUoc3RydWN0IHVkZXZpY2Ug
KmRldikKPj4gK3sKPj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3QgdGVlX29wdGVlX3RhX3V1aWQgdXVp
ZCA9IFRBX0hXUk5HX1VVSUQ7Cj4+ICvCoMKgwqAgc3RydWN0IG9wdGVlX3JuZ19wcml2ICpwcml2
ID0gZGV2X2dldF9wcml2KGRldik7Cj4+ICvCoMKgwqAgc3RydWN0IHRlZV9vcGVuX3Nlc3Npb25f
YXJnIHNlc3NfYXJnID0gezB9Owo+PiArwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gK8KgwqDCoCAv
KiBPcGVuIHNlc3Npb24gd2l0aCBod3JuZyBUcnVzdGVkIEFwcCAqLwo+PiArwqDCoMKgIHRlZV9v
cHRlZV90YV91dWlkX3RvX29jdGV0cyhzZXNzX2FyZy51dWlkLCAmdXVpZCk7Cj4+ICvCoMKgwqAg
c2Vzc19hcmcuY2xudF9sb2dpbiA9IFRFRV9MT0dJTl9QVUJMSUM7Cj4+ICsKPj4gK8KgwqDCoCBy
ZXQgPSB0ZWVfb3Blbl9zZXNzaW9uKGRldi0+cGFyZW50LCAmc2Vzc19hcmcsIDAsIE5VTEwpOwo+
PiArwqDCoMKgIGlmIChyZXQgfHwgc2Vzc19hcmcucmV0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAoIXJldCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTzsKPj4gK8KgwqDC
oMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiY2FuJ3Qgb3BlbiBzZXNzaW9uOiAlZCAweCV4XG4iLCBy
ZXQsIAo+PiBzZXNzX2FyZy5yZXQpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4g
K8KgwqDCoCB9Cj4+ICvCoMKgwqAgcHJpdi0+c2Vzc2lvbl9pZCA9IHNlc3NfYXJnLnNlc3Npb247
Cj4KPiBJcyBpdCByZWFsbHkgbmVjZXNzYXJ5IHRvIGtlZXAgdGhlIHNlc3Npb24gb3Blbj8KPiBP
ciBzaG91bGQgd2UgcmVvcGVuIGEgc2Vzc2lvbiB3aGVuZXZlciBhIHJhbmRvbSBudW1iZXIgaXMg
cmVxdWVzdGVkPwo+Cj4gQmVzdCByZWdhcmRzCj4KPiBIZWlucmljaAo+CgpObywgSSBkb24ndCB0
aGluayB0aGF0IGl0IGlzIG5lY2Vzc2FyeS4KCkkganVzdCB1c2UgdGhlIHNhbWUgbWVjaGFuaXNt
IHRoYW4gTGludXggZHJpdmVyCgooZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9vcHRlZS1ybmcuYzpv
cHRlZV9ybmdfcHJvYmUvb3B0ZWVfcm5nX3JlbW92ZSkKCm9yIGluIG90aGVyIFUtQm9vdCBkcml2
ZXIgPSBkcml2ZXJzL3RwbS90cG0yX2Z0cG1fdGVlLmMuCgoKQnV0IEkgY2hlY2sgd2l0aCBFdGll
bm5lLCB3aGljaCBwcm92aWRlIHRoZSBTQ01JIG92ZXIgT1AtVEVFIGltcGxlbWVudGF0aW9uLAoK
SXQgc2VlbnMgdGhhdCBtYW5hZ2UgdGhlIG9wdGVlIHNlc3Npb24gaW4gcHJvYmUvcmVtb3ZlIGZ1
bmN0aW9uIGluIFUtQm9vdCBpcwoKbm90IHJlY29tbWVuZGVkLCBiZWNhdXNlIHdoZW4gdGhlIGRy
aXZlcnMgYXJlIHVzZWQgYmVmb3JlIHJlbG9jYXRpb24gdGhlCgpyZW1vdmUgZnVuY3Rpb24gaXMg
bm90IGNhbGxlZCAoc28gdGhlIHNlc3Npb24gaXMgbm90IGZyZWVkKQoKYW5kIGJlY2F1c2UgdGhl
IHRpbWUgb2YgdGhlIHNlc3Npb24gb3BlbiBwcm9jZWR1cmUgaXMgbm90IHRoZSBsYXJnZXN0IHBh
cnQuCgoKPT4gSSB3aWxsIHJlbW92ZSBpdCB0byBzaW1wbGlmeSB0aGlzIGRyaXZlci4KCgpyZWdh
cmRzCgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
