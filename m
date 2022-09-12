Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BDB5B59E7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 14:04:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12095C04003;
	Mon, 12 Sep 2022 12:04:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B91D5C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 12:04:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9kNq2015491;
 Mon, 12 Sep 2022 14:04:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=233S8LPJBLcegIERo5r5RNB42qVwzOMTOjRUaDkd5H4=;
 b=gCKLLOYSXWzS3QtnD54+M/h5jR1XU8HR8yZ6sL2sInAzLNAL5fPsVWzI7hEFdWKCWZQT
 A5ixFU+Lo2/gvePKAoHkuhcqhjY1EIjzLKXDmaj4DpGfC0M8oML76MmjfesjAGjI/X+t
 htJI814pcNXYd2GM01xx1GpWQ0PutN6YvEAUb4N5Wl8HeWTVUEoE8VXih1Zd73lOxxGX
 MM1/MWXHgHQOmqOQuuvwU1M25PQu8OpmWpeySUZj0YPN/Do9EGEVMOJyeR0AKr0cbVxX
 ZxolqicHm3Nm53BBRJUFsoYkiAYQyJ+v4w8DPC5dcfAmj6TFZHH0hGc+wBTGe1WYSIWa DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnstqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 14:04:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81A3110002A;
 Mon, 12 Sep 2022 14:04:45 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7AD90229A78;
 Mon, 12 Sep 2022 14:04:45 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 14:04:23 +0200
Message-ID: <566ebc3a-3a91-f4c1-e164-bd3da8da83bc@foss.st.com>
Date: Mon, 12 Sep 2022 14:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-5-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-5-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_08,2022-09-12_01,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] i2c: stm32: fix usage of rise/fall
 device tree properties
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

SGksCgpPbiA5LzEyLzIyIDEwOjQyLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gRnJvbTogSm9yZ2Ug
UmFtaXJlei1PcnRpeiA8am9yZ2VAZm91bmRyaWVzLmlvPgo+Cj4gVGhlc2UgdHdvIGRldmljZSB0
cmVlIHByb3BlcnRpZXMgd2VyZSBub3QgYmVpbmcgYXBwbGllZC4KPgo+IEZpeGVzOiAxZmQ5ZWI2
OGQ2ICgiaTJjOiBzdG0zMmY3OiBtb3ZlIGRyaXZlciBkYXRhIG9mIGVhY2ggaW5zdGFuY2UgaW4g
YSBwcml2ZGF0YSIpCj4gU2lnbmVkLW9mZi1ieTogSm9yZ2UgUmFtaXJlei1PcnRpeiA8am9yZ2VA
Zm91bmRyaWVzLmlvPgo+IFJldmlld2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBm
b3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMgfCAxMSArKysr
KystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jIGIvZHJpdmVycy9p
MmMvc3RtMzJmN19pMmMuYwo+IGluZGV4IDJkYjdmNDRkNDQuLjFkMmRkOGUyNWQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+ICsrKyBiL2RyaXZlcnMvaTJjL3N0bTMy
ZjdfaTJjLmMKPiBAQCAtOTE0LDE4ICs5MTQsMTkgQEAgc3RhdGljIGludCBzdG0zMl9vZl90b19w
bGF0KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0IHN0bTMyX2ky
Y19kYXRhICpkYXRhOwo+ICAgCXN0cnVjdCBzdG0zMl9pMmNfcHJpdiAqaTJjX3ByaXYgPSBkZXZf
Z2V0X3ByaXYoZGV2KTsKPiAtCXUzMiByaXNlX3RpbWUsIGZhbGxfdGltZTsKPiAgIAlpbnQgcmV0
Owo+ICAgCj4gICAJZGF0YSA9IChjb25zdCBzdHJ1Y3Qgc3RtMzJfaTJjX2RhdGEgKilkZXZfZ2V0
X2RyaXZlcl9kYXRhKGRldik7Cj4gICAJaWYgKCFkYXRhKQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsK
PiAgIAo+IC0JcmlzZV90aW1lID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAiaTJjLXNjbC1y
aXNpbmctdGltZS1ucyIsCj4gLQkJCQkJIFNUTTMyX0kyQ19SSVNFX1RJTUVfREVGQVVMVCk7Cj4g
KwlpMmNfcHJpdi0+c2V0dXAucmlzZV90aW1lID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LAo+
ICsJCQkJCQkJICJpMmMtc2NsLXJpc2luZy10aW1lLW5zIiwKPiArCQkJCQkJCSBTVE0zMl9JMkNf
UklTRV9USU1FX0RFRkFVTFQpOwo+ICAgCj4gLQlmYWxsX3RpbWUgPSBkZXZfcmVhZF91MzJfZGVm
YXVsdChkZXYsICJpMmMtc2NsLWZhbGxpbmctdGltZS1ucyIsCj4gLQkJCQkJIFNUTTMyX0kyQ19G
QUxMX1RJTUVfREVGQVVMVCk7Cj4gKwlpMmNfcHJpdi0+c2V0dXAuZmFsbF90aW1lID0gZGV2X3Jl
YWRfdTMyX2RlZmF1bHQoZGV2LAo+ICsJCQkJCQkJICJpMmMtc2NsLWZhbGxpbmctdGltZS1ucyIs
Cj4gKwkJCQkJCQkgU1RNMzJfSTJDX0ZBTExfVElNRV9ERUZBVUxUKTsKPiAgIAo+ICAgCWkyY19w
cml2LT5kbmZfZHQgPSBkZXZfcmVhZF91MzJfZGVmYXVsdChkZXYsICJpMmMtZGlnaXRhbC1maWx0
ZXItd2lkdGgtbnMiLCAwKTsKPiAgIAlpZiAoIWRldl9yZWFkX2Jvb2woZGV2LCAiaTJjLWRpZ2l0
YWwtZmlsdGVyIikpCgoKClJldmlld2VkLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2sKCgoKUmV2aWV3ZWQtYnk6IFBhdHJp
Y2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+ClRlc3RlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4gCltzdG0zMm1wMTU3
Yy1kazJdCgpObyByZWdyZXNzaW9uIGRldGVjdGlvbiBvbiBTVCBNaWNyb2VsZWN0b25pY3MgYm9h
cmQuCgotIE5vIGVycm9yIHRyYWNlIG9uIGJvb3QKCi0gSTJDIHByb2JlIGNvbW1hbmQgaXMgT0sK
CiDCoCBTVE0zMk1QPiBpMmMgcHJvYmUKIMKgIFZhbGlkIGNoaXAgYWRkcmVzc2VzOiAyOCAzMwoK
LSBBbmQgb3RoZXIgdGVzdHMgZG9uZSB3aXRoIHRoZSAyIEkyQyBkZXZpY2VzIFNUUE1JQzEgJiBT
VFVTQjE2MDAgYXJlIG9rOgogwqAgcmVndWxhbG9yIGNvbW1hbmQKCiDCoCBwbWljIHN0YXR1cyBj
b21tYW5kCgogwqAgVVNCIHR5cGUgQyBjb25uZWN0aW9uL2RlY29ubmVjdGlvbgoKCkBKb3JnZTog
Y2FuIHlvdSB0ZXN0IGFsc28gZm9yIHlvdXIgdXNlLWNhc2UsIHRoYW5rcwoKClRoYW5rcwpQYXRy
aWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
