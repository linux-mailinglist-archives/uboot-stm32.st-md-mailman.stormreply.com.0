Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C485B55CE
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:19:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E067C03FD5;
	Mon, 12 Sep 2022 08:19:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22F0CC035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:19:35 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6X8Xx025870;
 Mon, 12 Sep 2022 10:19:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8zkV1ZY79Gygty8ISIriGORxmaFLVvPX/BM9kDmu19s=;
 b=sP54DA0TyzBf/VTeCXumf9WdTitQ81MZz2bHCRuQlGQvOL9QU6IYuzMB2JeTBBLrht9c
 zb8euMoJ3C067oR8RsVSwXMNM7PnU1qYU5jJvmQkP8cAUa1wgJMIfLgmA/OrUAfxsmqy
 msmpmmnCmg2i8wiviZ5WidUvLYggFrL9KInDVLLD3cUP22m0B2iRBE/+M3YqHG/bCsfN
 uCWoaq7IF6qR18nQODXMyn1YS6fyWIy7VgaFoI32YO3LiJjpPqEIEBkFzQpAE++nNGsY
 o/FOZQpAM+lZbmCFv93Mh51EOIVaa2Y24Lx12fomGKmBY4xUWkwr3J49U2LG0Xn8lfeA lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnrfkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:19:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5303410002A;
 Mon, 12 Sep 2022 10:19:32 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DD6C2171E3;
 Mon, 12 Sep 2022 10:19:32 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.122) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:19:29 +0200
Message-ID: <ab83ad30-4cf2-8c6d-81ad-9edb47d646a2@foss.st.com>
Date: Mon, 12 Sep 2022 10:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-4-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220909160627.1793406-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] i2c: stm32: do not set the STOP
	condition on error
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

SGkgQWxhaW4sCgpPbiA5LzkvMjIgMTg6MDYsIEFsYWluIFZvbG1hdCB3cm90ZToKPiBDdXJyZW50
IGZ1bmN0aW9uIHN0bTMyX2kyY19tZXNzYWdlX3hmZXIgaXMgc2VuZGluZyBhIFNUT1AKPiB3aGF0
ZXZlciB0aGUgcmVzdWx0IG9mIHRoZSB0cmFuc2FjdGlvbiBpcy4gIFRoaXMgY2FuIGNhdXNlIGlz
c3Vlcwo+IHN1Y2ggYXMgbWFraW5nIHRoZSBidXMgYnVzeSBzaW5jZSB0aGUgY29udHJvbGxlciBp
dHNlbGYgaXMgYWxyZWFkeQo+IHNlbmRpbmcgYXV0b21hdGljYWxseSBhIFNUT1Agd2hlbiBhIE5B
Q0sgaXMgZ2VuZXJhdGVkLgo+Cj4gVGhhbmtzIHRvIEpvcmdlIFJhbWlyZXotT3J0aXogZm9yIGRp
YWdub3NpbmcgYW5kIHByb3Bvc2luZyBhIGZpcnN0Cj4gZml4IGZvciB0aGlzLiBbMV0KPgo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy91LWJvb3QvMjAyMjA4MTUxNDUyMTEuMzEzNDItMi1q
b3JnZUBmb3VuZHJpZXMuaW8vCj4KPiBSZXBvcnRlZC1ieTogSm9yZ2UgUmFtaXJlei1PcnRpeiwg
Rm91bmRyaWVzIDxqb3JnZUBmb3VuZHJpZXMuaW8+Cj4gU2lnbmVkLW9mZi1ieTogSm9yZ2UgUmFt
aXJlei1PcnRpeiA8am9yZ2VAZm91bmRyaWVzLmlvPgo+IFNpZ25lZC1vZmYtYnk6IEFsYWluIFZv
bG1hdCA8YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9pMmMvc3Rt
MzJmN19pMmMuYyB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL3N0bTMyZjdfaTJj
LmMgYi9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4gaW5kZXggMGVjNjdiNWMxMi4uMmRiN2Y0
NGQ0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jCj4gKysrIGIvZHJp
dmVycy9pMmMvc3RtMzJmN19pMmMuYwo+IEBAIC00ODMsOSArNDgzLDkgQEAgc3RhdGljIGludCBz
dG0zMl9pMmNfbWVzc2FnZV94ZmVyKHN0cnVjdCBzdG0zMl9pMmNfcHJpdiAqaTJjX3ByaXYsCj4g
ICAJCX0KPiAgIAl9Cj4gICAKPiAtCS8qIEVuZCBvZiB0cmFuc2Zlciwgc2VuZCBzdG9wIGNvbmRp
dGlvbiAqLwo+IC0JbWFzayA9IFNUTTMyX0kyQ19DUjJfU1RPUDsKPiAtCXNldGJpdHNfbGUzMigm
cmVncy0+Y3IyLCBtYXNrKTsKPiArCS8qIEVuZCBvZiB0cmFuc2Zlciwgc2VuZCBzdG9wIGNvbmRp
dGlvbiBpZiBhcHByb3ByaWF0ZSAqLwo+ICsJaWYgKCFyZXQgJiYgIShzdGF0dXMgJiAoU1RNMzJf
STJDX0lTUl9OQUNLRiB8IFNUTTMyX0kyQ19JU1JfRVJST1JTKSkpCj4gKwkJc2V0Yml0c19sZTMy
KCZyZWdzLT5jcjIsIFNUTTMyX0kyQ19DUjJfU1RPUCk7Cj4gICAKPiAgIAlyZXR1cm4gc3RtMzJf
aTJjX2NoZWNrX2VuZF9vZl9tZXNzYWdlKGkyY19wcml2KTsKPiAgIH0KCgoKUmV2aWV3ZWQtYnk6
IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+ClRlc3RlZC1i
eTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4gW3N0bTMy
bXAxNTdjLWRrMl0KCk5vIHJlZ3Jlc3Npb24gZGV0ZWN0aW9uIG9uIFNUIE1pY3JvZWxlY3Rvbmlj
cyBib2FyZC4KCi0gTm8gZXJyb3IgdHJhY2Ugb24gYm9vdAoKLSBJMkMgcHJvYmUgY29tbWFuZCBp
cyBPSwoKIMKgIFNUTTMyTVA+IGkyYyBwcm9iZQogwqAgVmFsaWQgY2hpcCBhZGRyZXNzZXM6IDI4
IDMzCgotIEFuZCBvdGhlciB0ZXN0cyBkb25lIHdpdGggdGhlIDIgSTJDIGRldmljZXMgU1RQTUlD
MSAmIFNUVVNCMTYwMCBhcmUgb2s6CiDCoCByZWd1bGFsb3IgY29tbWFuZAoKIMKgIHBtaWMgc3Rh
dHVzIGNvbW1hbmQKCiDCoCBVU0IgdHlwZSBDIGNvbm5lY3Rpb24vZGVjb25uZWN0aW9uCgoKQEpv
cmdlOiBjYW4geW91IHRlc3QgYWxzbyBmb3IgeW91ciB1c2UtY2FzZSwgdGhhbmtzCgoKVGhhbmtz
ClBhdHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
