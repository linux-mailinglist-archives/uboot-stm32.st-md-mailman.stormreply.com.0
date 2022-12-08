Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28782646A4B
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 09:19:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C71A6C65067;
	Thu,  8 Dec 2022 08:19:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4FE2C63327
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 08:19:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B84RUIS004326; Thu, 8 Dec 2022 09:19:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EKL7W7FfgU6C+c/I8TFvbE27xnQz3OGN4dpc0C46LAc=;
 b=glezo3Qco18Sqt7hV+h5nv4bO4025Lm13r1NijRjNBDRO0/qRu6YwZdlLpACcfEQQBlZ
 LG1UTf1MqMidW91VCD+b9Srn/uJ7Dia3+q7vXhk3Meb1C1uNq6vv4oWUeSrSzjV+wVv6
 21ltSYszdFoeyEwa/FufPTOkFYFwCjk8IIJ4uONqdVJX8rktUX5cepPOlgYMKq7VvoYc
 gSYBsuEN6ydr4nMnkj9hZsATWbTYSO1jKkV8tnXu5ASenVd3On4R1za3BDamWlUdiUqV
 vQX7PGEG9ewGEHnWbhIHbHaq3e/EujNfC6OmXO7f3GWru4rNtzQoiP0KAMAnNPqliVu0 wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vrrdfms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Dec 2022 09:19:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E591810002A;
 Thu,  8 Dec 2022 09:19:16 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D60DB2171C1;
 Thu,  8 Dec 2022 09:19:16 +0100 (CET)
Received: from [10.201.20.130] (10.201.20.130) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 8 Dec
 2022 09:19:16 +0100
Message-ID: <6c8b6387-17bf-a4d1-8c75-d9cfdf512351@foss.st.com>
Date: Thu, 8 Dec 2022 09:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
 <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
X-Originating-IP: [10.201.20.130]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_04,2022-12-07_01,2022-06-22_01
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

SGkgTWFyZWsKCkkgYW0gcHJlcGFyaW5nIGEgU1RNMzIgcHVsbCByZXF1ZXN0IHdoaWNoIGluY2x1
ZGVzIHRoaXMgc2VyaWVzIAoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vi
b290L3BhdGNoLzIwMjIxMjA2MDIzNTE1LjExMzU1Ni0xLW1hcmV4QGRlbnguZGUvCgpXZSBnb3Qg
YSBERlUgY29tcGlsYXRpb24gaXNzdWUgd2l0aCB0aGlzIHNlcmllcyA6CgogICAgICAgYXJtOiAg
KyAgIHN0bTMybXAxNV9kaGNvbV9iYXNpYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAorL3Vzci9saWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3NldHVwdG9v
bHMvZGlzdC5weTo0NzM6IFVzZXJXYXJuaW5nOiBOb3JtYWxpemluZyAnMjAyMy4wMScgdG8gJzIw
MjMuMScKKyAgd2FybmluZ3Mud2FybigKK2FybS1saW51eC1nbnVlYWJpLWxkLmJmZDogZHJpdmVy
cy9kZnUvZGZ1Lm86IGluIGZ1bmN0aW9uIGBkZnVfZmlsbF9lbnRpdHknOgorZHJpdmVycy9kZnUv
ZGZ1LmM6NTQ4OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkZnVfZmlsbF9lbnRpdHlfdmlydCcK
K21ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5zcGw6NTI3OiBzcGwvdS1ib290LXNwbF0g
RXJyb3IgMQorbWFrZVsxXTogKioqIFtNYWtlZmlsZToyMDcxOiBzcGwvdS1ib290LXNwbF0gRXJy
b3IgMgorbWFrZTogKioqIFtNYWtlZmlsZToxNzc6IHN1Yi1tYWtlXSBFcnJvciAyCiAgICAgICBh
cm06ICArICAgc3RtMzJtcDE1X2RoY29yX2Jhc2ljICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAorL3Vzci9saWIvcHl0aG9uMy9kaXN0LXBhY2thZ2VzL3NldHVwdG9vbHMvZGlzdC5weTo0NzM6
IFVzZXJXYXJuaW5nOiBOb3JtYWxpemluZyAnMjAyMy4wMScgdG8gJzIwMjMuMScKKyAgd2Fybmlu
Z3Mud2FybigKK2FybS1saW51eC1nbnVlYWJpLWxkLmJmZDogZHJpdmVycy9kZnUvZGZ1Lm86IGlu
IGZ1bmN0aW9uIGBkZnVfZmlsbF9lbnRpdHknOgorZHJpdmVycy9kZnUvZGZ1LmM6NTQ4OiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBkZnVfZmlsbF9lbnRpdHlfdmlydCcKK21ha2VbMl06ICoqKiBb
c2NyaXB0cy9NYWtlZmlsZS5zcGw6NTI3OiBzcGwvdS1ib290LXNwbF0gRXJyb3IgMQorbWFrZVsx
XTogKioqIFtNYWtlZmlsZToyMDcxOiBzcGwvdS1ib290LXNwbF0gRXJyb3IgMgorbWFrZTogKioq
IFtNYWtlZmlsZToxNzc6IHN1Yi1tYWtlXSBFcnJvciAyCgoKVGhlIGNvcnJlY3QgZml4IGlzIHRo
aXMgcGF0Y2ggYmVsb3cgd2hpY2ggaXMgY3VycmVudGx5IGluIHlvdXIgdXNiL21hc3RlciBicmFu
Y2guCkkgcHJvcG9zZSB0byB0YWtlIHRoaXMgcGF0Y2ggaW4gbXkgcHVsbCByZXF1ZXN0IChhdmFp
bGFibGUgdG9kYXkgb3IgdG9tb3Jyb3cpIHRvIG1ha2UgR2l0TGFiIENpIHRlc3RzIGhhcHB5LgoK
QXJlIHlvdSBPSyA/CgpUaGFua3MKUGF0cmljZQoKT24gMTIvNC8yMiAxOTo1NSwgTWFyZWsgVmFz
dXQgd3JvdGU6Cj4gT24gMTEvMzAvMjIgMTE6NDIsIFBhdHJpY2sgRGVsYXVuYXkgd3JvdGU6Cj4+
IERlZmluZSBzdHViIGZvciBkZnVfKl92aXJ0IGZ1bmN0aW9uIGluIFNQTCwgYmVjYXVzZQo+PiBD
T05GSUdfU1BMX0RGVV9WSVJUIGlzIG5vdCBkZWZpbmVkLgo+Pgo+PiBUaGlzIHBhdGNoIGF2b2lk
cyBjb21waWxhdGlvbiBpc3N1ZSBpbiBkZnVfZmlsbF9lbnRpdHkoKSB3aGVuCj4+IENPTkZJR19T
UExfREZVIGlzIGFjdGl2YXRlZCBiZWNhdXNlIHRoZSBkZnVfZmlsbF9lbnRpdHlfdmlydCgpCj4+
IGZ1bmN0aW9uIGlzIG5vdCBhdmFpbGFibGUuCj4+Cj4+IEZpeGVzOiBlYzQ0Y2FjZTRiOGQyICgi
ZGZ1OiBhZGQgREZVIHZpcnR1YWwgYmFja2VuZCIpCj4+IFJlcG9ydGVkLWJ5OiBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0
cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IFNlZSBpbml0aWFsIHBhdGNoIHBy
b3Bvc2FsOgo+PiBodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC91Ym9vdC9wYXRj
aC8yMDIyMTEyODE5MzkxNy4yMzYxODgtMS1tYXJleEBkZW54LmRlLwo+Pgo+PiDCoCBpbmNsdWRl
L2RmdS5oIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZGZ1LmggYi9pbmNsdWRlL2RmdS5o
Cj4+IGluZGV4IGRjYjljZDlkNzk5YS4uMDc5MjIyMjRlZjE5IDEwMDY0NAo+PiAtLS0gYS9pbmNs
dWRlL2RmdS5oCj4+ICsrKyBiL2luY2x1ZGUvZGZ1LmgKPj4gQEAgLTQ5NSw3ICs0OTUsNyBAQCBz
dGF0aWMgaW5saW5lIGludCBkZnVfZmlsbF9lbnRpdHlfbXRkKHN0cnVjdCBkZnVfZW50aXR5ICpk
ZnUsIGNoYXIgKmRldnN0ciwKPj4gwqAgfQo+PiDCoCAjZW5kaWYKPj4gwqAgLSNpZmRlZiBDT05G
SUdfREZVX1ZJUlQKPj4gKyNpZiBDT05GSUdfSVNfRU5BQkxFRChERlVfVklSVCkKPj4gwqAgaW50
IGRmdV9maWxsX2VudGl0eV92aXJ0KHN0cnVjdCBkZnVfZW50aXR5ICpkZnUsIGNoYXIgKmRldnN0
ciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGFyICoqYXJndiwgaW50IGFyZ2Mp
Owo+PiDCoCBpbnQgZGZ1X3dyaXRlX21lZGl1bV92aXJ0KHN0cnVjdCBkZnVfZW50aXR5ICpkZnUs
IHU2NCBvZmZzZXQsCj4gCj4gUmV2aWV3ZWQtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRl
Pgo+IFRlc3RlZC1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKPiBVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3Rt
MzIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
