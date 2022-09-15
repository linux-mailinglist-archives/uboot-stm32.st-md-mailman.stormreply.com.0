Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606C85B9EC9
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:28:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D323C03FE0;
	Thu, 15 Sep 2022 15:28:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6D64C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:28:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FB2tKp012480;
 Thu, 15 Sep 2022 17:28:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=da2jwtLAJn7bDMKM1X+rLHKYQmGsWSOzThNjeScyqSY=;
 b=70UPcAzh++t2dFBCRtsMn6VWab28Rhj/qSzzSoFglIhuh+KZggW7BytM0ayo1xICVS+D
 Ek75Tncnd6PgbTL3Oy1TOZJBrygENqBF+AEA2oPNagvgSAVO/YQTeCBJa2GlG5o6Ye5Q
 07/nt9//LgKKc/7Vkp6aw5JP2pqxkFeVBzbOnUpIJwE6Sk4J3/AeX+jg1J9U5Ngj3zpk
 7d3GYMlFPVECbF8vWBTGzn75KEYL4C8tWJe5sz9JnUu8yneLru4/aV+S+dspt0ozJxjp
 R5qFTVd1PD51GWHNzKaKNfnyGOL4s3AfolXc3h9EHA5dZ8lFGJ1waIXMH4dAud0rMyJE Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjy07nhsm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:28:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E5F30100034;
 Thu, 15 Sep 2022 17:28:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E1BC9232FEC;
 Thu, 15 Sep 2022 17:28:17 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:28:16 +0200
Message-ID: <11a98305-d578-5787-3b1e-eea162ca7435@foss.st.com>
Date: Thu, 15 Sep 2022 17:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-4-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, uboot-stm32@st-md-mailman.stormreply.com,
 hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 3/4] i2c: stm32: do not set the STOP
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

SGkgQWxhaW4KCk9uIDkvMTIvMjIgMTA6NDIsIEFsYWluIFZvbG1hdCB3cm90ZToKPiBDdXJyZW50
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
aTJjX2NoZWNrX2VuZF9vZl9tZXNzYWdlKGkyY19wcml2KTsKPiAgIH0KCgpBcHBsaWVkIHRvIHUt
Ym9vdC1zdG0vbWFzdGVyLCB0aGFua3MhCgoKSSBhbHNvIGFkZCB0aGUgbWlzc2luZyBSZXZpZXdl
ZC1ieSB3aGVuIEkgZ2V0IHRoZSBwYXRjaCBmcm9tIHBhdGNod29yawoKaHR0cDovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMjA5MTIwODQyMDEuMTgyNjk3OS00
LWFsYWluLnZvbG1hdEBmb3NzLnN0LmNvbS8KCivCoMKgwqAgUmV2aWV3ZWQtYnk6IFBhdHJpY2Ug
Q2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgorwqDCoMKgIFJldmlld2VkLWJ5
OiBIZWlrbyBTY2hvY2hlciA8aHNAZGVueC5kZT4KK8KgwqDCoCBSZXZpZXdlZC1ieTogUGF0cmlj
ayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KK8KgwqDCoCBUZXN0ZWQt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+CgpSZWdh
cmRzClBhdHJpY2sKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
