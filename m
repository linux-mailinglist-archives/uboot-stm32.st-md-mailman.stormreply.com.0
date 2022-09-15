Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A65B9EB2
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:25:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01D37C03FE0;
	Thu, 15 Sep 2022 15:25:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9012C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:25:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FAsYvq009807;
 Thu, 15 Sep 2022 17:25:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oX2HhnNN2ibu73SrCN0T773JCr612q0l0MNQYJ8dDSo=;
 b=tUQyhAKW+9mTen+O4ByPH3TVl5N55qYv67LKsPF6ozg+83dGyZHi+TiGiEwhU1ZTnVHG
 gAqA6LtShKJrLPuTDpSiBf6iUHWRJcjB0sdMtHpVaPwH7w2T59y2LkryaNy1BZBXkvYs
 atlVfoTwgVGom0pL5OhzJvDimRUvifOEemoUjxf9HkLZoAYFiEQNnqarUjD6qNdsPxWT
 1YxjhYZ2kYn8NY5F+1NS5Q1kjVY3TRcg0dz7NKZDgAi9c6FX0XJ7pHeMfX14UOUfoLTx
 DxF6hM3A/eoBhc4ZGxeg2AshlaXGc10vczges86e8JcTmXqjef9WsP/HaO65ruQOWj5Q fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxaxc8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:25:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB35210002A;
 Thu, 15 Sep 2022 17:25:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B6B71232FE4;
 Thu, 15 Sep 2022 17:25:33 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:25:32 +0200
Message-ID: <596d70a5-fea4-57ab-a9f9-532e03a9c043@foss.st.com>
Date: Thu, 15 Sep 2022 17:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-3-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-3-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 2/4] i2c: stm32: remove unused stop
 parameter in start & reload handling
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

SGkgQWxhaW4sCgpPbiA5LzEyLzIyIDEwOjQxLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gRnVuY3Rp
b25zIHN0bTMyX2kyY19tZXNzYWdlX3N0YXJ0IGFuZCBzdG0zMl9pMmNfaGFuZGxlX3JlbG9hZAo+
IGJvdGggZ2V0IGEgc3RvcCBib29sZWFuIGluZGljYXRpbmcgaWYgdGhlIHRyYW5zZmVyIHNob3Vs
ZCBlbmQgd2l0aAo+IGEgU1RPUCBvciBub3QuICBIb3dldmVyIG5vIHNwZWNpZmljIGhhbmRsaW5n
IGlzIG5lZWRlZCBpbiB0aG9zZQo+IGZ1bmN0aW9ucyBoZW5jZSByZW1vdmUgdGhlIHBhcmFtZXRl
ci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsYWluIFZvbG1hdCA8YWxhaW4udm9sbWF0QGZvc3Muc3Qu
Y29tPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZv
c3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYyB8IDggKysrKy0t
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYyBiL2RyaXZlcnMvaTJjL3N0
bTMyZjdfaTJjLmMKPiBpbmRleCA3OGQ3MTU2NDkyLi4wZWM2N2I1YzEyIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMKPiArKysgYi9kcml2ZXJzL2kyYy9zdG0zMmY3X2ky
Yy5jCj4gQEAgLTI4Miw3ICsyODIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2kyY19jaGVja19kZXZp
Y2VfYnVzeShzdHJ1Y3Qgc3RtMzJfaTJjX3ByaXYgKmkyY19wcml2KQo+ICAgfQo+ICAgCj4gICBz
dGF0aWMgdm9pZCBzdG0zMl9pMmNfbWVzc2FnZV9zdGFydChzdHJ1Y3Qgc3RtMzJfaTJjX3ByaXYg
KmkyY19wcml2LAo+IC0JCQkJICAgIHN0cnVjdCBpMmNfbXNnICptc2csIGJvb2wgc3RvcCkKPiAr
CQkJCSAgICBzdHJ1Y3QgaTJjX21zZyAqbXNnKQo+ICAgewo+ICAgCXN0cnVjdCBzdG0zMl9pMmNf
cmVncyAqcmVncyA9IGkyY19wcml2LT5yZWdzOwo+ICAgCXUzMiBjcjIgPSByZWFkbCgmcmVncy0+
Y3IyKTsKPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX2kyY19tZXNzYWdl
X3N0YXJ0KHN0cnVjdCBzdG0zMl9pMmNfcHJpdiAqaTJjX3ByaXYsCj4gICAgKi8KPiAgIAo+ICAg
c3RhdGljIHZvaWQgc3RtMzJfaTJjX2hhbmRsZV9yZWxvYWQoc3RydWN0IHN0bTMyX2kyY19wcml2
ICppMmNfcHJpdiwKPiAtCQkJCSAgICBzdHJ1Y3QgaTJjX21zZyAqbXNnLCBib29sIHN0b3ApCj4g
KwkJCQkgICAgc3RydWN0IGkyY19tc2cgKm1zZykKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3RtMzJfaTJj
X3JlZ3MgKnJlZ3MgPSBpMmNfcHJpdi0+cmVnczsKPiAgIAl1MzIgY3IyID0gcmVhZGwoJnJlZ3Mt
PmNyMik7Cj4gQEAgLTQzMSw3ICs0MzEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2kyY19tZXNzYWdl
X3hmZXIoc3RydWN0IHN0bTMyX2kyY19wcml2ICppMmNfcHJpdiwKPiAgIAkvKiBBZGQgZXJyb3Jz
ICovCj4gICAJbWFzayB8PSBTVE0zMl9JMkNfSVNSX0VSUk9SUzsKPiAgIAo+IC0Jc3RtMzJfaTJj
X21lc3NhZ2Vfc3RhcnQoaTJjX3ByaXYsIG1zZywgc3RvcCk7Cj4gKwlzdG0zMl9pMmNfbWVzc2Fn
ZV9zdGFydChpMmNfcHJpdiwgbXNnKTsKPiAgIAo+ICAgCXdoaWxlIChtc2ctPmxlbikgewo+ICAg
CQkvKgo+IEBAIC00NjksNyArNDY5LDcgQEAgc3RhdGljIGludCBzdG0zMl9pMmNfbWVzc2FnZV94
ZmVyKHN0cnVjdCBzdG0zMl9pMmNfcHJpdiAqaTJjX3ByaXYsCj4gICAJCQltYXNrID0gbXNnLT5m
bGFncyAmIEkyQ19NX1JEID8gU1RNMzJfSTJDX0lTUl9SWE5FIDoKPiAgIAkJCSAgICAgICBTVE0z
Ml9JMkNfSVNSX1RYSVMgfCBTVE0zMl9JMkNfSVNSX05BQ0tGOwo+ICAgCj4gLQkJCXN0bTMyX2ky
Y19oYW5kbGVfcmVsb2FkKGkyY19wcml2LCBtc2csIHN0b3ApOwo+ICsJCQlzdG0zMl9pMmNfaGFu
ZGxlX3JlbG9hZChpMmNfcHJpdiwgbXNnKTsKPiAgIAkJfSBlbHNlIGlmICghYnl0ZXNfdG9fcncp
IHsKPiAgIAkJCS8qIFdhaXQgdW50aWwgVEMgZmxhZyBpcyBzZXQgKi8KPiAgIAkJCW1hc2sgPSBT
VE0zMl9JMkNfSVNSX1RDOwoKCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5rcyEK
CgpJIGFsc28gYWRkIHRoZSBtaXNzaW5nIFJldmlld2VkLWJ5IHdoZW4gSSBnZXQgdGhlIHBhdGNo
IGZyb20gcGF0Y2h3b3JrCgpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9v
dC9wYXRjaC8yMDIyMDkxMjA4NDIwMS4xODI2OTc5LTMtYWxhaW4udm9sbWF0QGZvc3Muc3QuY29t
LwoKK8KgwqDCoCBSZXZpZXdlZC1ieTogSGVpa28gU2Nob2NoZXIgPGhzQGRlbnguZGU+CivCoMKg
wqAgUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3Qu
Y29tPgoKClJlZ2FyZHMKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
