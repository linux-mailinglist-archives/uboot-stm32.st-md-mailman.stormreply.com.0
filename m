Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F15801F1
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Jul 2022 17:34:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B73EC5C829;
	Mon, 25 Jul 2022 15:34:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E14B4C03FC0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jul 2022 15:34:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PBdBb0008989;
 Mon, 25 Jul 2022 17:33:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=ZSO86hEdVd0g3CZHkbejJExh2Rzj8Cav2YtL3+O7qdk=;
 b=rpGDYtok/BhI9jTRRQ4uwjyu5oopjssFF1rQW/wUlaObRkE0JDLRnj6r84kZC7MpPylG
 pJ8rqP4fatdbDyQi+S/F/SlOgNSKfHgkz7LtUecWpfMpL66GrN9Ujuz0yaFVqSd5zdpO
 ISvKz3EFWIip8zj+EFmlVJYRvoe/7nVB/Wwd6AXYgAls5BBplxdl0a0jjIsB82DqCUNw
 4djr9v1IgTuqvyrHNMKrNa54H0eYoL1UD09cWF7i4mqovfKmyq9nHk5cg4Vj3biziKLl
 MhrP+SwM5iDVwW3E88C9KkqQf6oLHAIrDAoMcwNWCcEzTfxWOEL54WsPdtsQlX4rC7Fh oQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hg7vhahxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 17:33:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61E9110002A;
 Mon, 25 Jul 2022 17:33:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C30C226FC3;
 Mon, 25 Jul 2022 17:33:56 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Jul
 2022 17:33:55 +0200
Message-ID: <bce66d19-eed2-ab40-0101-0262f551c673@foss.st.com>
Date: Mon, 25 Jul 2022 17:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Philip Oberfichtner <pro@denx.de>, <u-boot@lists.denx.de>
References: <20220725081950.25452-1-pro@denx.de>
 <20220725081950.25452-5-pro@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220725081950.25452-5-pro@denx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_10,2022-07-25_02,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, peng.fan@nxp.com,
 festevam@denx.de, u-boot@dh-electronics.com, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 sbabic@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 4/4] ARM: stm32: DH: Use common MAC
	address functions
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

SGksCgpPbiA3LzI1LzIyIDEwOjE5LCBQaGlsaXAgT2JlcmZpY2h0bmVyIHdyb3RlOgo+IFRvIHJl
ZHVjZSBjb2RlIGR1cGxpY2F0aW9uLCBsZXQgdGhlIHN0bTMyIGJhc2VkIERIIGJvYXJkcyB1c2Ug
dGhlIGNvbW1vbgo+IGNvZGUgZm9yIHNldHRpbmcgdXAgdGhlaXIgTUFDIGFkZHJlc3Nlcy4KPgo+
IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBPYmVyZmljaHRuZXIgPHByb0BkZW54LmRlPgo+IFRlc3Rl
ZC1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAgICAgICAg
IC0gUmV2aWV3ZWQgYnkgTWFyZWsKPgo+IENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAgLSBjb252
ZXJ0IHRvIGxpdmV0cmVlIChyZWJhc2Ugb24gY29tbWl0IDVhNjA1YjdjODYxNTIpCj4gICAgICAg
ICAgLSBUZXN0ZWQtYnkgTWFyZWsKPgo+ICAgYm9hcmQvZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1w
MS9ib2FyZC5jIHwgMTAyICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDQ1IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Jv
YXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYyBiL2JvYXJkL2RoZWxlY3Ryb25p
Y3MvZGhfc3RtMzJtcDEvYm9hcmQuYwo+IGluZGV4IDdhNGMwOGNiN2YuLmFiMzU0ZTNlMzMgMTAw
NjQ0Cj4gLS0tIGEvYm9hcmQvZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jCj4gKysr
IGIvYm9hcmQvZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jCj4gQEAgLTQyLDYgKzQy
LDcgQEAKPiAgICNpbmNsdWRlIDx1c2IvZHdjMl91ZGMuaD4KPiAgICNpbmNsdWRlIDx3YXRjaGRv
Zy5oPgo+ICAgI2luY2x1ZGUgPGRtL29mbm9kZS5oPgo+ICsjaW5jbHVkZSAiLi4vY29tbW9uL2Ro
X2NvbW1vbi5oIgo+ICAgI2luY2x1ZGUgIi4uLy4uL3N0L2NvbW1vbi9zdHBtaWMxLmgiCj4gICAK
PiAgIC8qIFNZU0NGRyByZWdpc3RlcnMgKi8KPiBAQCAtODQsMzYgKzg1LDE3IEBACj4gICAjZGVm
aW5lIEtTX0NJREVSCTB4QzAKPiAgICNkZWZpbmUgQ0lERVJfSUQJMHg4ODcwCj4gICAKPiAtaW50
IHNldHVwX21hY19hZGRyZXNzKHZvaWQpCj4gK3N0YXRpYyBib29sIGRoX3N0bTMyX21hY19pc19p
bl9rczg4NTEodm9pZCkKPiAgIHsKPiAtCXVuc2lnbmVkIGNoYXIgZW5ldGFkZHJbNl07Cj4gLQli
b29sIHNraXBfZXRoMCA9IGZhbHNlOwo+IC0JYm9vbCBza2lwX2V0aDEgPSBmYWxzZTsKPiAtCXN0
cnVjdCB1ZGV2aWNlICpkZXY7Cj4gLQlpbnQgcmV0Owo+ICAgCW9mbm9kZSBub2RlOwo+IC0KPiAt
CXJldCA9IGV0aF9lbnZfZ2V0X2VuZXRhZGRyKCJldGhhZGRyIiwgZW5ldGFkZHIpOwo+IC0JaWYg
KHJldCkJLyogZXRoYWRkciBpcyBhbHJlYWR5IHNldCAqLwo+IC0JCXNraXBfZXRoMCA9IHRydWU7
Cj4gKwl1MzIgcmVnLCBjaWRlciwgY2NyOwo+ICAgCj4gICAJbm9kZSA9IG9mbm9kZV9wYXRoKCJl
dGhlcm5ldDEiKTsKPiAtCWlmICghb2Zub2RlX3ZhbGlkKG5vZGUpKSB7Cj4gLQkJLyogZXRoZXJu
ZXQxIGlzIG5vdCBwcmVzZW50IGluIHRoZSBzeXN0ZW0gKi8KPiAtCQlza2lwX2V0aDEgPSB0cnVl
Owo+IC0JCWdvdG8gb3V0X3NldF9ldGhhZGRyOwo+IC0JfQo+ICsJaWYgKCFvZm5vZGVfdmFsaWQo
bm9kZSkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICAgCj4gLQlyZXQgPSBldGhfZW52X2dldF9lbmV0
YWRkcigiZXRoMWFkZHIiLCBlbmV0YWRkcik7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJLyogZXRoMWFk
ZHIgaXMgYWxyZWFkeSBzZXQgKi8KPiAtCQlza2lwX2V0aDEgPSB0cnVlOwo+IC0JCWdvdG8gb3V0
X3NldF9ldGhhZGRyOwo+IC0JfQo+IC0KPiAtCXJldCA9IG9mbm9kZV9kZXZpY2VfaXNfY29tcGF0
aWJsZShub2RlLCAibWljcmVsLGtzODg1MS1tbGwiKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byBv
dXRfc2V0X2V0aGFkZHI7Cj4gKwlpZiAob2Zub2RlX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUs
ICJtaWNyZWwsa3M4ODUxLW1sbCIpKQo+ICsJCXJldHVybiBmYWxzZTsKPiAgIAo+ICAgCS8qCj4g
ICAJICogS1M4ODUxIHdpdGggRUVQUk9NIG1heSB1c2UgY3VzdG9tIE1BQyBmcm9tIEVFUFJPTSwg
cmVhZAo+IEBAIC0xMjEsNTYgKzEwMyw2MiBAQCBpbnQgc2V0dXBfbWFjX2FkZHJlc3Modm9pZCkK
PiAgIAkgKiBpcyBwcmVzZW50LiBJZiBFRVBST00gaXMgcHJlc2VudCwgaXQgbXVzdCBjb250YWlu
IHZhbGlkCj4gICAJICogTUFDIGFkZHJlc3MuCj4gICAJICovCj4gLQl1MzIgcmVnLCBjaWRlciwg
Y2NyOwo+ICAgCXJlZyA9IG9mbm9kZV9nZXRfYWRkcihub2RlKTsKPiAgIAlpZiAoIXJlZykKPiAt
CQlnb3RvIG91dF9zZXRfZXRoYWRkcjsKPiArCQlyZXR1cm4gZmFsc2U7Cj4gICAKPiAgIAl3cml0
ZXcoS1NfQkUwIHwgS1NfQkUxIHwgS1NfQ0lERVIsIHJlZyArIDIpOwo+ICAgCWNpZGVyID0gcmVh
ZHcocmVnKTsKPiAtCWlmICgoY2lkZXIgJiAweGZmZjApICE9IENJREVSX0lEKSB7Cj4gLQkJc2tp
cF9ldGgxID0gdHJ1ZTsKPiAtCQlnb3RvIG91dF9zZXRfZXRoYWRkcjsKPiAtCX0KPiArCWlmICgo
Y2lkZXIgJiAweGZmZjApICE9IENJREVSX0lEKQo+ICsJCXJldHVybiB0cnVlOwo+ICAgCj4gICAJ
d3JpdGV3KEtTX0JFMCB8IEtTX0JFMSB8IEtTX0NDUiwgcmVnICsgMik7Cj4gICAJY2NyID0gcmVh
ZHcocmVnKTsKPiAtCWlmIChjY3IgJiBLU19DQ1JfRUVQUk9NKSB7Cj4gLQkJc2tpcF9ldGgxID0g
dHJ1ZTsKPiAtCQlnb3RvIG91dF9zZXRfZXRoYWRkcjsKPiAtCX0KPiArCWlmIChjY3IgJiBLU19D
Q1JfRUVQUk9NKQo+ICsJCXJldHVybiB0cnVlOwo+ICsKPiArCXJldHVybiBmYWxzZTsKPiArfQo+
ICAgCj4gLW91dF9zZXRfZXRoYWRkcjoKPiAtCWlmIChza2lwX2V0aDAgJiYgc2tpcF9ldGgxKQo+
ICtzdGF0aWMgaW50IGRoX3N0bTMyX3NldHVwX2V0aGFkZHIodm9pZCkKPiArewo+ICsJdW5zaWdu
ZWQgY2hhciBlbmV0YWRkcls2XTsKPiArCj4gKwlpZiAoZGhfbWFjX2lzX2luX2VudigiZXRoYWRk
ciIpKQo+ICAgCQlyZXR1cm4gMDsKPiAgIAo+IC0Jbm9kZSA9IG9mbm9kZV9wYXRoKCJlZXByb20w
Iik7Cj4gLQlpZiAoIW9mbm9kZV92YWxpZChub2RlKSkgewo+IC0JCXByaW50ZigiJXM6IE5vIGVl
cHJvbTAgcGF0aCBvZmZzZXRcbiIsIF9fZnVuY19fKTsKPiAtCQlyZXR1cm4gLUVOT0VOVDsKPiAt
CX0KPiArCWlmICghZGhfZ2V0X21hY19mcm9tX2VlcHJvbShlbmV0YWRkciwgImVlcHJvbTAiKSkK
PiArCQlyZXR1cm4gZXRoX2Vudl9zZXRfZW5ldGFkZHIoImV0aGFkZHIiLCBlbmV0YWRkcik7Cj4g
ICAKPiAtCXJldCA9IHVjbGFzc19nZXRfZGV2aWNlX2J5X29mbm9kZShVQ0xBU1NfSTJDX0VFUFJP
TSwgbm9kZSwgJmRldik7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJcHJpbnRmKCJDYW5ub3QgZmluZCBF
RVBST00hXG4iKTsKPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+ICsJcmV0dXJuIC1FTlhJTzsKPiAr
fQo+ICAgCj4gLQlyZXQgPSBpMmNfZWVwcm9tX3JlYWQoZGV2LCAweGZhLCBlbmV0YWRkciwgMHg2
KTsKPiAtCWlmIChyZXQpIHsKPiAtCQlwcmludGYoIkVycm9yIHJlYWRpbmcgY29uZmlndXJhdGlv
biBFRVBST00hXG4iKTsKPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+ICtzdGF0aWMgaW50IGRoX3N0
bTMyX3NldHVwX2V0aDFhZGRyKHZvaWQpCj4gK3sKPiArCXVuc2lnbmVkIGNoYXIgZW5ldGFkZHJb
Nl07Cj4gICAKPiAtCWlmIChpc192YWxpZF9ldGhhZGRyKGVuZXRhZGRyKSkgewo+IC0JCWlmICgh
c2tpcF9ldGgwKQo+IC0JCQlldGhfZW52X3NldF9lbmV0YWRkcigiZXRoYWRkciIsIGVuZXRhZGRy
KTsKPiArCWlmIChkaF9tYWNfaXNfaW5fZW52KCJldGgxYWRkciIpKQo+ICsJCXJldHVybiAwOwo+
ICAgCj4gKwlpZiAoZGhfc3RtMzJfbWFjX2lzX2luX2tzODg1MSgpKQo+ICsJCXJldHVybiAwOwo+
ICsKPiArCWlmICghZGhfZ2V0X21hY19mcm9tX2VlcHJvbShlbmV0YWRkciwgImVlcHJvbTAiKSkg
ewo+ICAgCQllbmV0YWRkcls1XSsrOwo+IC0JCWlmICghc2tpcF9ldGgxKQo+IC0JCQlldGhfZW52
X3NldF9lbmV0YWRkcigiZXRoMWFkZHIiLCBlbmV0YWRkcik7Cj4gKwkJcmV0dXJuIGV0aF9lbnZf
c2V0X2VuZXRhZGRyKCJldGgxYWRkciIsIGVuZXRhZGRyKTsKPiAgIAl9Cj4gICAKPiArCXJldHVy
biAtRU5YSU87Cj4gK30KPiArCj4gK2ludCBzZXR1cF9tYWNfYWRkcmVzcyh2b2lkKQo+ICt7Cj4g
KwlpZiAoZGhfc3RtMzJfc2V0dXBfZXRoYWRkcigpKQo+ICsJCXByaW50ZigiJXM6IFVuYWJsZSB0
byBzZXR1cCBldGhhZGRyIVxuIiwgX19mdW5jX18pOwo+ICsKPiArCWlmIChkaF9zdG0zMl9zZXR1
cF9ldGgxYWRkcigpKQo+ICsJCXByaW50ZigiJXM6IFVuYWJsZSB0byBzZXR1cCBldGgxYWRkciFc
biIsIF9fZnVuY19fKTsKPiArCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKCgpNaW5vciByZW1h
cmtzIG9uIHRoZSBsYXN0IGZ1bmN0aW9uOgoKIMKgwqAgdGhlIDIgJ3ByaW50ZicgY2FsbHMgY2Fu
IGJlIHJlcGxhY2VkIGJ5IGxvZ19lcnJvcigpIGNhbGwgKG9yIApsb2dfZGVidWcgPykKCiDCoMKg
wqAgdG8gY29ycmVjdGx5IGhhbmRsZSB0aGlzIHRyYWNlIHdpdGggQ09ORklHX0xPR19MRVZFTAoK
PT4gcHJpbnRmIHNob3VsZCBhdm9pZCBleGNlcHQgaW4gY29tbWFuZCByZXN1bHQgdG8gaGFuZGxl
IGxvZyBmZWF0dXJlcyAKZHVyaW5nIGluaXRpYWxpemF0aW9uCgoKQW55d2F5CgoKUmV2aWV3ZWQt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpUaGFu
a3MKUGF0cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
