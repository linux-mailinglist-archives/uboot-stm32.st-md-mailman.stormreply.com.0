Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BF5AE9C7
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 15:35:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B3AFC63325;
	Tue,  6 Sep 2022 13:35:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67441C63324
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 13:35:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286BmXX6013831;
 Tue, 6 Sep 2022 15:35:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=LD9U0eBF8atfNXghjsvApecYSG/1bjbztHA3BPtftiQ=;
 b=3KTOIITCZIAzDXZK6ZeQjjIem9fOcFNn0EV77HNVcJikgmQKY1VovvtwnNOoOV6uw3Ho
 SbRYMndvGIx+1p0bPflfm1q20P+hSPSWQZ3oSPsP51T7gL3pRMSAukAxzFyMEv2+OOe2
 aD0CmSMt8C/q/veLvxdn+twlndfrawZ2Ir1zuOOxLMxZrQFjPdjm1OHWkQe6a9OAUsQS
 uaD6f3SF8fVJmZq+S08h8MEKYnUbdJGz6Fr03YS6FfdfYzyUu+7k+wwNg60lWf2m1jHL
 enC13Vt7viQ6xUGZiN8vnZUi+G8sxrZFodvVAWxwF3NZ65vWSa4bt6MvHBNBJcP/jP9l pA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jdcav1c0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 15:35:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC25B100038;
 Tue,  6 Sep 2022 15:35:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58A2A22D197;
 Tue,  6 Sep 2022 15:35:32 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 6 Sep
 2022 15:35:32 +0200
Message-ID: <e91ec205-bb8c-564e-44ea-472526a23231@foss.st.com>
Date: Tue, 6 Sep 2022 15:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Etienne Carriere <etienne.carriere@linaro.org>, <u-boot@lists.denx.de>
References: <20220905091528.579610-1-etienne.carriere@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220905091528.579610-1-etienne.carriere@linaro.org>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32mp15: remove hwlocks from
	pinctrl
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

SGkgRXRpZW5uZSwKCk9uIDkvNS8yMiAxMToxNSwgRXRpZW5uZSBDYXJyaWVyZSB3cm90ZToKPiBS
ZW1vdmVzIGh3bG9ja3MgcHJvcGVydGllcyBmcm9tIHN0bTMybXAxNTEgcGluY3RybCBub2RlLiBU
aGVzZSBsb2Nrcwo+IGNvdWxkIGJlIHVzZWQgZm9yIG90aGVyIHB1cnBvc2UsIGRlcGVuZGluZyBv
biBib2FyZCBhbmQgc29mdHdhcmUKPiBjb25maWd1cmF0aW9uIGhlbmNlIGRvIG5vdCBlbmZvcmNl
IHRoZWlyIHVzZSB0byBwcm90ZWN0IHBpbmN0cmwKPiBkZXZpY2VzLgo+Cj4gVGhpcyBwYXRjaCBp
cyBhbiBhbGlnbm1lbnQgd2l0aCBMaW51eCBkZXZpY2UgdHJlZSB3aXRoIHY2LjAgYXMgdGhlCj4g
aHdzZW0gc3VwcG9ydCB3YXNu4oCZdCB5ZXQgYWRkZWQgaW4gcGluY29udHJvbCBpbiBrZXJuZWwu
IEl0IGF2b2lkcwo+IGlzc3VlcyB3aGVuIHRoZSBMaW51eCBrZXJuZWwgaXMgc3RhcnRlZCB3aXRo
IHRoZSBVLUJvb3QgZGV2aWNlIHRyZWUuCj4KPiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVs
YXVuYXlAZm9zcy5zdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRp
ZW5uZS5jYXJyaWVyZUBsaW5hcm8ub3JnPgo+IC0tLQo+ICAgYXJjaC9hcm0vZHRzL3N0bTMybXAx
NTEuZHRzaSB8IDIgLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2FybS9kdHMvc3Rt
MzJtcDE1MS5kdHNpCj4gaW5kZXggYTVhYzYyYzgzZC4uNzY3YTA2ZWY2OCAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS9kdHMvc3RtMzJtcDE1MS5kdHNpCj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMy
bXAxNTEuZHRzaQo+IEBAIC0xNjYzLDcgKzE2NjMsNiBAQAo+ICAgCQkJcmFuZ2VzID0gPDAgMHg1
MDAwMjAwMCAweGE0MDA+Owo+ICAgCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47Cj4gICAJ
CQlzdCxzeXNjZmcgPSA8JmV4dGkgMHg2MCAweGZmPjsKPiAtCQkJaHdsb2NrcyA9IDwmaHdzcGlu
bG9jayAwPjsKPiAgIAkJCXBpbnMtYXJlLW51bWJlcmVkOwo+ICAgCj4gICAJCQlncGlvYTogZ3Bp
b0A1MDAwMjAwMCB7Cj4gQEAgLTE3OTYsNyArMTc5NSw2IEBACj4gICAJCQlwaW5zLWFyZS1udW1i
ZXJlZDsKPiAgIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAgCQkJc3Qsc3lzY2Zn
ID0gPCZleHRpIDB4NjAgMHhmZj47Cj4gLQkJCWh3bG9ja3MgPSA8Jmh3c3BpbmxvY2sgMD47Cj4g
ICAKPiAgIAkJCWdwaW96OiBncGlvQDU0MDA0MDAwIHsKPiAgIAkJCQlncGlvLWNvbnRyb2xsZXI7
CgoKUmV2aWV3ZWQtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+CgpUaGFua3MKUGF0cmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
