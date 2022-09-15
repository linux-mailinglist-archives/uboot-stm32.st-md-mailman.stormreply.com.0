Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F535B9F25
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Sep 2022 17:48:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E720C0D2BB;
	Thu, 15 Sep 2022 15:48:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C9CAC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Sep 2022 15:48:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FBMN6M013251;
 Thu, 15 Sep 2022 17:48:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BFJ248zGWkUhWDOXqde5CNvnWUeo1CNKg3IwmIWkqjg=;
 b=fyRHnZ9aKCJ2XvdVlyGLs6lLFZTHf7VxNPa6JMR6SGtvBBwfRSXWCqvUi7BsIs133RDE
 bvXQEbyrEexWafgG7gg6m6mSVJf0DVp92fhtHruy8o8LeOcszjMQ8EFSJgHB/h1KyHu0
 Xmf9DSY0+JP4O5NljY/H6QpQJElEISab5pEPsOnm3IIjdqXK88t+lnurR3/wwMGaGprY
 ixjib8nCZi/uj+OVQ3Mh25xUyGg2vnmGktypc8604Vbm3es69gW+qCN+KQDQqejULwnx
 M0c4P8AWXpmX0HtQI18zWxDEHUC1RJD+BKXWSsNxiItyTVKdPls57yy7YYti8BtaMbuo kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jjxxcxfxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Sep 2022 17:48:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70AA010002A;
 Thu, 15 Sep 2022 17:48:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67A4A233C6F;
 Thu, 15 Sep 2022 17:48:26 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 15 Sep
 2022 17:48:23 +0200
Message-ID: <00ea142a-91be-bb30-d855-29e8f8c525f0@foss.st.com>
Date: Thu, 15 Sep 2022 17:48:22 +0200
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
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_10,2022-09-14_04,2022-06-22_01
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

SGkgQWxhaW4sCgpPbiA5LzEyLzIyIDEwOjQyLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gRnJvbTog
Sm9yZ2UgUmFtaXJlei1PcnRpeiA8am9yZ2VAZm91bmRyaWVzLmlvPgo+Cj4gVGhlc2UgdHdvIGRl
dmljZSB0cmVlIHByb3BlcnRpZXMgd2VyZSBub3QgYmVpbmcgYXBwbGllZC4KPgo+IEZpeGVzOiAx
ZmQ5ZWI2OGQ2ICgiaTJjOiBzdG0zMmY3OiBtb3ZlIGRyaXZlciBkYXRhIG9mIGVhY2ggaW5zdGFu
Y2UgaW4gYSBwcml2ZGF0YSIpCj4gU2lnbmVkLW9mZi1ieTogSm9yZ2UgUmFtaXJlei1PcnRpeiA8
am9yZ2VAZm91bmRyaWVzLmlvPgo+IFJldmlld2VkLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZv
bG1hdEBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvaTJjL3N0bTMyZjdfaTJjLmMgfCAx
MSArKysrKystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9zdG0zMmY3X2kyYy5jIGIvZHJp
dmVycy9pMmMvc3RtMzJmN19pMmMuYwo+IGluZGV4IDJkYjdmNDRkNDQuLjFkMmRkOGUyNWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9pMmMvc3RtMzJmN19pMmMuYwo+ICsrKyBiL2RyaXZlcnMvaTJj
L3N0bTMyZjdfaTJjLmMKPiBAQCAtOTE0LDE4ICs5MTQsMTkgQEAgc3RhdGljIGludCBzdG0zMl9v
Zl90b19wbGF0KHN0cnVjdCB1ZGV2aWNlICpkZXYpCj4gICB7Cj4gICAJY29uc3Qgc3RydWN0IHN0
bTMyX2kyY19kYXRhICpkYXRhOwo+ICAgCXN0cnVjdCBzdG0zMl9pMmNfcHJpdiAqaTJjX3ByaXYg
PSBkZXZfZ2V0X3ByaXYoZGV2KTsKPiAtCXUzMiByaXNlX3RpbWUsIGZhbGxfdGltZTsKPiAgIAlp
bnQgcmV0Owo+ICAgCj4gICAJZGF0YSA9IChjb25zdCBzdHJ1Y3Qgc3RtMzJfaTJjX2RhdGEgKilk
ZXZfZ2V0X2RyaXZlcl9kYXRhKGRldik7Cj4gICAJaWYgKCFkYXRhKQo+ICAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiAgIAo+IC0JcmlzZV90aW1lID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAiaTJj
LXNjbC1yaXNpbmctdGltZS1ucyIsCj4gLQkJCQkJIFNUTTMyX0kyQ19SSVNFX1RJTUVfREVGQVVM
VCk7Cj4gKwlpMmNfcHJpdi0+c2V0dXAucmlzZV90aW1lID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQo
ZGV2LAo+ICsJCQkJCQkJICJpMmMtc2NsLXJpc2luZy10aW1lLW5zIiwKPiArCQkJCQkJCSBTVE0z
Ml9JMkNfUklTRV9USU1FX0RFRkFVTFQpOwo+ICAgCj4gLQlmYWxsX3RpbWUgPSBkZXZfcmVhZF91
MzJfZGVmYXVsdChkZXYsICJpMmMtc2NsLWZhbGxpbmctdGltZS1ucyIsCj4gLQkJCQkJIFNUTTMy
X0kyQ19GQUxMX1RJTUVfREVGQVVMVCk7Cj4gKwlpMmNfcHJpdi0+c2V0dXAuZmFsbF90aW1lID0g
ZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LAo+ICsJCQkJCQkJICJpMmMtc2NsLWZhbGxpbmctdGlt
ZS1ucyIsCj4gKwkJCQkJCQkgU1RNMzJfSTJDX0ZBTExfVElNRV9ERUZBVUxUKTsKPiAgIAo+ICAg
CWkyY19wcml2LT5kbmZfZHQgPSBkZXZfcmVhZF91MzJfZGVmYXVsdChkZXYsICJpMmMtZGlnaXRh
bC1maWx0ZXItd2lkdGgtbnMiLCAwKTsKPiAgIAlpZiAoIWRldl9yZWFkX2Jvb2woZGV2LCAiaTJj
LWRpZ2l0YWwtZmlsdGVyIikpCgoKCkFwcGxpZWQgdG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5r
cyEKCkkgYWxzbyBhZGQgdGhlIG1pc3NpbmcgUmV2aWV3ZWQtYnkgd2hlbiBJIGdldCB0aGUgcGF0
Y2ggZnJvbSBwYXRjaHdvcmsKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vi
b290L3BhdGNoLzIwMjIwOTEyMDg0MjAxLjE4MjY5NzktNS1hbGFpbi52b2xtYXRAZm9zcy5zdC5j
b20vIAoKCivCoCBSZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRA
Zm9zcy5zdC5jb20+CivCoCBSZXZpZXdlZC1ieTogSGVpa28gU2Nob2NoZXIgPGhzQGRlbnguZGU+
CivCoCBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KK8KgIFRlc3RlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5h
eUBmb3NzLnN0LmNvbT4KClJlZ2FyZHMKUGF0cmljawoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
