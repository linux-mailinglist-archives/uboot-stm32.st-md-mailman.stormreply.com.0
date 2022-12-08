Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FE647111
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 14:54:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EA86C65067;
	Thu,  8 Dec 2022 13:54:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DF02C6411C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 13:54:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B8AVsVL004136; Thu, 8 Dec 2022 14:54:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0iXLUZx4Ew+W8WAxrmptFJMWmVGweAe0Q5qL31xWysc=;
 b=3wru4VCGPbRl/ESiDVioPzZUtnVRf6iwb2Sdn2CRGyHJo1y3ECej+VeBFq/+zz6zb/P/
 tGHSM5jdqpYghcYsKZ6H+ontXe9waGygWT2oUJaIRwUV42Oy0l1d21XKi82DIncXP8gp
 sm9Tjd9TixyXFzUHIlQrAA3W9HS/0BOY6fiEVyb46UjBJFSLy5JL2Ez9vPuTzeHT4KJb
 yy/xtODYhmjj+H+8aMNLsHMi/kDwcZKc9AoXHwAB4/QLIbxRU+no5cMnl0b9rszCIw7s
 Y3Q1iFevkK5FI1oO6FbVIinwkgKG4sNUCRyabcZpoZoGf7Kt+bQLPDffWr+1PoZKZYmQ 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrrfgqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 14:54:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60E1C100034;
 Thu,  8 Dec 2022 14:53:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 528B222A6DA;
 Thu,  8 Dec 2022 14:53:57 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 8 Dec
 2022 14:53:56 +0100
Message-ID: <35330e71-f6d5-7a05-c1a9-51e3b9ecc488@foss.st.com>
Date: Thu, 8 Dec 2022 14:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
 <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
 <6c8b6387-17bf-a4d1-8c75-d9cfdf512351@foss.st.com>
 <a50b41c6-b6e9-4a9d-9995-d7e3baf412ce@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <a50b41c6-b6e9-4a9d-9995-d7e3baf412ce@denx.de>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_07,2022-12-08_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: Make DFU virtual backend SPL friendly
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

CgpPbiAxMi84LzIyIDE0OjI3LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiAxMi84LzIyIDA5OjE5
LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+IEhpIE1hcmVrCj4gCj4gSGVsbG8gUGF0cmljZSwK
PiAKPj4gSSBhbSBwcmVwYXJpbmcgYSBTVE0zMiBwdWxsIHJlcXVlc3Qgd2hpY2ggaW5jbHVkZXMg
dGhpcyBzZXJpZXMKPj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vi
b290L3BhdGNoLzIwMjIxMjA2MDIzNTE1LjExMzU1Ni0xLW1hcmV4QGRlbnguZGUvCj4+Cj4+IFdl
IGdvdCBhIERGVSBjb21waWxhdGlvbiBpc3N1ZSB3aXRoIHRoaXMgc2VyaWVzIDoKPj4KPj4gwqDC
oMKgwqDCoMKgwqAgYXJtOsKgICvCoMKgIHN0bTMybXAxNV9kaGNvbV9iYXNpYwo+PiArL3Vzci9s
aWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3NldHVwdG9vbHMvZGlzdC5weTo0NzM6IFVzZXJXYXJu
aW5nOiBOb3JtYWxpemluZyAnMjAyMy4wMScgdG8gJzIwMjMuMScKPj4gK8KgIHdhcm5pbmdzLndh
cm4oCj4+ICthcm0tbGludXgtZ251ZWFiaS1sZC5iZmQ6IGRyaXZlcnMvZGZ1L2RmdS5vOiBpbiBm
dW5jdGlvbiBgZGZ1X2ZpbGxfZW50aXR5JzoKPj4gK2RyaXZlcnMvZGZ1L2RmdS5jOjU0ODogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZGZ1X2ZpbGxfZW50aXR5X3ZpcnQnCj4+ICttYWtlWzJdOiAq
KiogW3NjcmlwdHMvTWFrZWZpbGUuc3BsOjUyNzogc3BsL3UtYm9vdC1zcGxdIEVycm9yIDEKPj4g
K21ha2VbMV06ICoqKiBbTWFrZWZpbGU6MjA3MTogc3BsL3UtYm9vdC1zcGxdIEVycm9yIDIKPj4g
K21ha2U6ICoqKiBbTWFrZWZpbGU6MTc3OiBzdWItbWFrZV0gRXJyb3IgMgo+PiDCoMKgwqDCoMKg
wqDCoCBhcm06wqAgK8KgwqAgc3RtMzJtcDE1X2RoY29yX2Jhc2ljCj4+ICsvdXNyL2xpYi9weXRo
b24zL2Rpc3QtcGFja2FnZXMvc2V0dXB0b29scy9kaXN0LnB5OjQ3MzogVXNlcldhcm5pbmc6IE5v
cm1hbGl6aW5nICcyMDIzLjAxJyB0byAnMjAyMy4xJwo+PiArwqAgd2FybmluZ3Mud2FybigKPj4g
K2FybS1saW51eC1nbnVlYWJpLWxkLmJmZDogZHJpdmVycy9kZnUvZGZ1Lm86IGluIGZ1bmN0aW9u
IGBkZnVfZmlsbF9lbnRpdHknOgo+PiArZHJpdmVycy9kZnUvZGZ1LmM6NTQ4OiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBkZnVfZmlsbF9lbnRpdHlfdmlydCcKPj4gK21ha2VbMl06ICoqKiBbc2Ny
aXB0cy9NYWtlZmlsZS5zcGw6NTI3OiBzcGwvdS1ib290LXNwbF0gRXJyb3IgMQo+PiArbWFrZVsx
XTogKioqIFtNYWtlZmlsZToyMDcxOiBzcGwvdS1ib290LXNwbF0gRXJyb3IgMgo+PiArbWFrZTog
KioqIFtNYWtlZmlsZToxNzc6IHN1Yi1tYWtlXSBFcnJvciAyCj4+Cj4+Cj4+IFRoZSBjb3JyZWN0
IGZpeCBpcyB0aGlzIHBhdGNoIGJlbG93IHdoaWNoIGlzIGN1cnJlbnRseSBpbiB5b3VyIHVzYi9t
YXN0ZXIgYnJhbmNoLgo+PiBJIHByb3Bvc2UgdG8gdGFrZSB0aGlzIHBhdGNoIGluIG15IHB1bGwg
cmVxdWVzdCAoYXZhaWxhYmxlIHRvZGF5IG9yIHRvbW9ycm93KSB0byBtYWtlIEdpdExhYiBDaSB0
ZXN0cyBoYXBweS4KPj4KPj4gQXJlIHlvdSBPSyA/Cj4gCj4gSSBzdGlsbCBoYXZlIG9uZSBtb3Jl
IHBhdGNoIHRvIHBpY2svcmV2aWV3IGFuZCB0aGVuIEknbGwgc2VuZCBVU0IgTVIuCj4gSSBjYW4g
YXNrIFRvbSB0byBwaWNrIGl0IGJlZm9yZSB0aGUgU1RNIE1SIGF0IHdoaWNoIHBvaW50IGl0IHNo
b3VsZCBhbGwgYmUgZmluZSA/CgpPaywgcGVyZmVjdC4KSSB3aWxsIHB1dCBhbiBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uIGluZGljYXRpbmcgdGhlIGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBTVE0z
MiBwdWxsIHJlcXVlc3QgYW5kIHRoZSBVU0Igb25lLgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
