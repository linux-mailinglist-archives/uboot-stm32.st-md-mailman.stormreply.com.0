Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9159832A53
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jan 2024 14:25:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D6D1C6DD74;
	Fri, 19 Jan 2024 13:25:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F17CDC6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 13:25:54 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40J9b5wc020013; Fri, 19 Jan 2024 14:25:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ZGXU45uES7rzrKnTQMBkjyhgi/MgJ4O3QlrDA0/5C/E=; b=JU
 529w0ytv1bkV5ZpnahKZF7teG3+4NRLX3cQhILenHN7KV8CHQKnP5fGbEXhOO/2c
 zDq5X7K4R5fFujFltH1uq3iIvdFE49YsVe4zj6x/M6G4gJkHy/gsMRJlpxzNf3fQ
 c70DB3yD5P4xqv2JqLgQzX4uWDfWVDKICKxAq7dez3e75KN7GrYnJGxEaEqr8lLV
 VAIM8o54QzYndNj2JaS6pIsaGNtAbtccaXQuRboLd8KuFEZGc95Z9mnQYhBnh7Fm
 wyhy4/vVsjHcxtHTpYW2tG5j0fIpk62ISeEYXbYnE5tBicIIqkH+d/7BICub6UXu
 xtDadDWntKCmPa1GBTfQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vm4y5budg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jan 2024 14:25:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6DF2100081;
 Fri, 19 Jan 2024 14:25:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CFD4823D41E;
 Fri, 19 Jan 2024 14:25:47 +0100 (CET)
Received: from [10.252.4.250] (10.252.4.250) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Jan
 2024 14:25:47 +0100
Message-ID: <bd33b14f-e356-471b-b817-bda60a94f11e@foss.st.com>
Date: Fri, 19 Jan 2024 14:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>
References: <20240115140557.57448-1-patrick.delaunay@foss.st.com>
 <20240115150451.v2.7.I122ede30eb83184b996b7d3e1c480418b29ffbe1@changeid>
 <CAByghJaABf37PeVgEPWaQAtpZK4O=brECrLLAWnhWc5mrpW92g@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAByghJaABf37PeVgEPWaQAtpZK4O=brECrLLAWnhWc5mrpW92g@mail.gmail.com>
X-Originating-IP: [10.252.4.250]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Subject: Re: [Uboot-stm32] [PATCH v2 07/14] stm32mp: add setup_serial_number
	for stm32mp25
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxLzE1LzI0IDE3OjIzLCBJZ29yIE9wYW5pdWsgd3JvdGU6Cj4gSGVsbG8gUGF0cmljaywK
PiAKPiBPbiBNb24sIEphbiAxNSwgMjAyNCBhdCA1OjAz4oCvUE0gUGF0cmljayBEZWxhdW5heQo+
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4gRnJvbTogUGF0cmlj
ZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+Cj4+IEFkZCBzdXBwb3J0
IG9mIHNlcmlhbCBudW1iZXIgZm9yIHN0bTMybXAyNSwgZ2V0cyBmcm9tIE9UUCB3aXRoIEJTRUMg
ZHJpdmVyLgo+Pgo+PiBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiAtLS0KPj4KPj4gKG5vIGNoYW5nZXMg
c2luY2UgdjEpCj4+Cj4+ICAuLi4vYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3By
b3RvLmggfCAgMSArCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAvc29jLmMgICAgICAgICAgICAg
ICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrCj4+ICBhcmNoL2FybS9tYWNoLXN0bTMybXAv
c3RtMzJtcDEvY3B1LmMgICAgICAgICAgfCAyNyAtLS0tLS0tLS0tLS0tLS0tCj4+ICBhcmNoL2Fy
bS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1LmMgICAgICAgICAgfCAgMiArKwo+PiAgNCBmaWxl
cyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3RvLmggYi9h
cmNoL2FybS9tYWNoLXN0bTMybXAvaW5jbHVkZS9tYWNoL3N5c19wcm90by5oCj4+IGluZGV4IDgz
Mzg4ZmRiNzM3MS4uMmE2NWVmYzBhNTBhIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0
bTMybXAvaW5jbHVkZS9tYWNoL3N5c19wcm90by5oCj4+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3Rt
MzJtcC9pbmNsdWRlL21hY2gvc3lzX3Byb3RvLmgKPj4gQEAgLTk3LDYgKzk3LDcgQEAgdTMyIGdl
dF9ib290YXV0aCh2b2lkKTsKPj4KPj4gIGludCBnZXRfZXRoX25iKHZvaWQpOwo+PiAgaW50IHNl
dHVwX21hY19hZGRyZXNzKHZvaWQpOwo+PiAraW50IHNldHVwX3NlcmlhbF9udW1iZXIodm9pZCk7
Cj4+Cj4+ICAvKiBib2FyZCBwb3dlciBtYW5hZ2VtZW50IDogY29uZmlndXJlIHZkZGNvcmUgYWNj
b3JkaW5nIE9QUCAqLwo+PiAgdm9pZCBib2FyZF92ZGRjb3JlX2luaXQodTMyIHZvbHRhZ2VfbXYp
Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NvYy5jIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3NvYy5jCj4+IGluZGV4IDhkNWZhNDc0Y2NhZi4uZmY3MGViZTk3NDY0IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc29jLmMKPj4gKysrIGIvYXJjaC9h
cm0vbWFjaC1zdG0zMm1wL3NvYy5jCj4+IEBAIC0zLDcgKzMsMTEgQEAKPj4gICAqIENvcHlyaWdo
dCAoQykgMjAyNCwgU1RNaWNyb2VsZWN0cm9uaWNzIC0gQWxsIFJpZ2h0cyBSZXNlcnZlZAo+PiAg
ICovCj4+Cj4+ICsjaW5jbHVkZSA8ZW52Lmg+Cj4+ICsjaW5jbHVkZSA8bWlzYy5oPgo+PiAgI2lu
Y2x1ZGUgPGFzbS9hcmNoL3N5c19wcm90by5oPgo+PiArI2luY2x1ZGUgPGRtL2RldmljZS5oPgo+
PiArI2luY2x1ZGUgPGRtL3VjbGFzcy5oPgo+Pgo+PiAgLyogdXNlZCB3aGVuIENPTkZJR19ESVNQ
TEFZX0NQVUlORk8gaXMgYWN0aXZhdGVkICovCj4+ICBpbnQgcHJpbnRfY3B1aW5mbyh2b2lkKQo+
PiBAQCAtMTUsMyArMTksMzAgQEAgaW50IHByaW50X2NwdWluZm8odm9pZCkKPj4KPj4gICAgICAg
ICByZXR1cm4gMDsKPj4gIH0KPj4gKwo+PiAraW50IHNldHVwX3NlcmlhbF9udW1iZXIodm9pZCkK
Pj4gK3sKPj4gKyAgICAgICBjaGFyIHNlcmlhbF9zdHJpbmdbMjVdOwo+PiArICAgICAgIHUzMiBv
dHBbM10gPSB7MCwgMCwgMCB9Owo+PiArICAgICAgIHN0cnVjdCB1ZGV2aWNlICpkZXY7Cj4+ICsg
ICAgICAgaW50IHJldDsKPj4gKwo+PiArICAgICAgIGlmIChlbnZfZ2V0KCJzZXJpYWwjIikpCj4+
ICsgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gKwo+PiArICAgICAgIHJldCA9IHVjbGFzc19n
ZXRfZGV2aWNlX2J5X2RyaXZlcihVQ0xBU1NfTUlTQywKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgRE1fRFJJVkVSX0dFVChzdG0zMm1wX2JzZWMpLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZGV2KTsKPj4gKyAgICAgICBp
ZiAocmV0KQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKwo+PiArICAgICAgIHJl
dCA9IG1pc2NfcmVhZChkZXYsIFNUTTMyX0JTRUNfU0hBRE9XKEJTRUNfT1RQX1NFUklBTCksCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIG90cCwgc2l6ZW9mKG90cCkpOwo+PiArICAgICAgIGlm
IChyZXQgPCAwKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gKwo+PiArICAgICAg
IHNwcmludGYoc2VyaWFsX3N0cmluZywgIiUwOFglMDhYJTA4WCIsIG90cFswXSwgb3RwWzFdLCBv
dHBbMl0pOwo+PiArICAgICAgIGVudl9zZXQoInNlcmlhbCMiLCBzZXJpYWxfc3RyaW5nKTsKPj4g
Kwo+PiArICAgICAgIHJldHVybiAwOwo+PiArfQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAx
L2NwdS5jCj4+IGluZGV4IDAwZmVhNzkyOWIyZi4uZjg0Y2IyNmZhNTY1IDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDEvY3B1LmMKPj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3N0bTMybXAxL2NwdS5jCj4+IEBAIC0zMzYsMzMgKzMzNiw2IEBAIF9fd2Vh
ayBpbnQgc2V0dXBfbWFjX2FkZHJlc3Modm9pZCkKPj4gICAgICAgICByZXR1cm4gMDsKPj4gIH0K
Pj4KPj4gLXN0YXRpYyBpbnQgc2V0dXBfc2VyaWFsX251bWJlcih2b2lkKQo+PiAtewo+PiAtICAg
ICAgIGNoYXIgc2VyaWFsX3N0cmluZ1syNV07Cj4+IC0gICAgICAgdTMyIG90cFszXSA9IHswLCAw
LCAwIH07Cj4+IC0gICAgICAgc3RydWN0IHVkZXZpY2UgKmRldjsKPj4gLSAgICAgICBpbnQgcmV0
Owo+PiAtCj4+IC0gICAgICAgaWYgKGVudl9nZXQoInNlcmlhbCMiKSkKPj4gLSAgICAgICAgICAg
ICAgIHJldHVybiAwOwo+PiAtCj4+IC0gICAgICAgcmV0ID0gdWNsYXNzX2dldF9kZXZpY2VfYnlf
ZHJpdmVyKFVDTEFTU19NSVNDLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBETV9EUklWRVJfR0VUKHN0bTMybXBfYnNlYyksCj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICZkZXYpOwo+PiAtICAgICAgIGlmIChyZXQpCj4+IC0g
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAtCj4+IC0gICAgICAgcmV0ID0gbWlzY19yZWFk
KGRldiwgU1RNMzJfQlNFQ19TSEFET1coQlNFQ19PVFBfU0VSSUFMKSwKPj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgb3RwLCBzaXplb2Yob3RwKSk7Cj4+IC0gICAgICAgaWYgKHJldCA8IDApCj4+
IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+PiAtCj4+IC0gICAgICAgc3ByaW50ZihzZXJp
YWxfc3RyaW5nLCAiJTA4WCUwOFglMDhYIiwgb3RwWzBdLCBvdHBbMV0sIG90cFsyXSk7Cj4+IC0g
ICAgICAgZW52X3NldCgic2VyaWFsIyIsIHNlcmlhbF9zdHJpbmcpOwo+PiAtCj4+IC0gICAgICAg
cmV0dXJuIDA7Cj4+IC19Cj4+IC0KPj4gIF9fd2VhayB2b2lkIHN0bTMybXBfbWlzY19pbml0KHZv
aWQpCj4+ICB7Cj4+ICB9Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3Rt
MzJtcDIvY3B1LmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3RtMzJtcDIvY3B1LmMKPj4gaW5k
ZXggYzBmNjUxOWU4ZDdjLi4zMDFlMzY1Y2Y0ZjQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9zdG0zMm1wMi9jcHUuYwo+PiArKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAv
c3RtMzJtcDIvY3B1LmMKPj4gQEAgLTY5LDYgKzY5LDggQEAgdm9pZCBlbmFibGVfY2FjaGVzKHZv
aWQpCj4+Cj4+ICBpbnQgYXJjaF9taXNjX2luaXQodm9pZCkKPj4gIHsKPj4gKyAgICAgICBzZXR1
cF9zZXJpYWxfbnVtYmVyKCk7Cj4+ICsKPj4gICAgICAgICByZXR1cm4gMDsKPj4gIH0KPj4KPj4g
LS0KPj4gMi4yNS4xCj4+Cj4gCj4gUmV2aWV3ZWQtYnk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFu
aXVrQGZvdW5kcmllcy5pbz4KPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFu
a3MKUGF0cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
