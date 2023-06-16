Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB4733116
	for <lists+uboot-stm32@lfdr.de>; Fri, 16 Jun 2023 14:23:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C923C65E58;
	Fri, 16 Jun 2023 12:23:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4067C64110
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 12:23:21 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35GBx56b008604; Fri, 16 Jun 2023 14:23:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cjZzUN6dsGtGZrA9wNVpV1usd7csKlq3sYnFgOVb/zs=;
 b=0KgTBTFQW/eBzU522uvnVv3WVrWq0k/s85Uy84DFXXPW2jQWuZLPKF9A2e/FCu0m8hL/
 9QmAKl6+2vbW5Q2cJwvRfXkc9yLuSf/MLbpKBUOAWrjhyc+evOaFPiA/DP1x9oazx/6l
 4y1SrE0ggpF5R62qIgKcjqxLtnPJxCO+7HeDO05hD43oJQrmnYs/y73HKjD148y/Tlqe
 o05ICqrcdFNS0Qb04Aui+A5cMqw81VQW+Ko+g+kxfgNVcQ0zDG6w2ab88eGYmjWIegSo
 leToy6ArzdQv8Ku6Kq0Qn0fYafOxqCBcnsf4an25VD36ftHcF+8xUAjesZw/jrh1YRbW dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r8m44hjyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jun 2023 14:23:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C04510002A;
 Fri, 16 Jun 2023 14:23:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36476235F32;
 Fri, 16 Jun 2023 14:23:12 +0200 (CEST)
Received: from [10.252.3.125] (10.252.3.125) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 16 Jun
 2023 14:23:11 +0200
Message-ID: <129fa8f9-d828-eef0-2530-e716a0fc4280@foss.st.com>
Date: Fri, 16 Jun 2023 14:23:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20230504195208.4941-1-marex@denx.de>
 <6fa1fdfc-d983-dcb9-7a4c-60055505bc79@foss.st.com>
 <2d510067-6725-0c84-b672-a0a701ac0fcf@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <2d510067-6725-0c84-b672-a0a701ac0fcf@denx.de>
X-Originating-IP: [10.252.3.125]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_08,2023-06-16_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Use __section(".data") with
 dot in the section name on DHSOM
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

CgpPbiA2LzE2LzIzIDE0OjE4LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA2LzE2LzIzIDEzOjQ2
LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDUvNC8yMyAyMTo1MiwgTWFyZWsg
VmFzdXQgd3JvdGU6Cj4+PiBUaGUgY29ycmVjdCBzcGVjaWZpZXIgb2YgdGhlIHNlY3Rpb24gaXMg
Ii5kYXRhIiBhbmQgbm90ICJkYXRhIiwKPj4+IHVzZSB0aGUgZm9ybWVyIHRvIHBsYWNlIHRoZSB2
YXJpYWJsZXMgaW4gIi5kYXRhIiBzZWN0aW9uLgo+Pj4KPj4+IEZpeGVzOiA3MzFmZDUwZTI3ZiAo
IkFSTTogc3RtMzI6IEltcGxlbWVudCBib2FyZCBjb2Rpbmcgb24gQVY5NiIpCj4+PiBGaXhlczog
OTJjYTBmNzQ0NmMgKCJBUk06IGR0czogc3RtMzI6IFN5bmNocm9uaXplIEREUiBzZXR0dGluZ3Mg
b24gREggU29NcyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5k
ZT4KPj4+IC0tLQo+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Mu
c3QuY29tPgo+Pj4gQ2M6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5z
dC5jb20+Cj4+PiBDYzogdS1ib290QGRoLWVsZWN0cm9uaWNzLmNvbQo+Pj4gQ2M6IHVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4+IC0tLQo+Pj4gwqAgYm9hcmQvZGhl
bGVjdHJvbmljcy9kaF9zdG0zMm1wMS9ib2FyZC5jIHwgNiArKystLS0KPj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2JvYXJkL2RoZWxlY3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYyBiL2JvYXJkL2RoZWxl
Y3Ryb25pY3MvZGhfc3RtMzJtcDEvYm9hcmQuYwo+Pj4gaW5kZXggYTlhMjk2NWEzODYuLmEwY2Rm
ODNlYTcxIDEwMDY0NAo+Pj4gLS0tIGEvYm9hcmQvZGhlbGVjdHJvbmljcy9kaF9zdG0zMm1wMS9i
b2FyZC5jCj4+PiArKysgYi9ib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmMK
Pj4+IEBAIC0xODUsOSArMTg1LDkgQEAgaW50IGNoZWNrYm9hcmQodm9pZCkKPj4+IMKgIH0KPj4+
IMKgIMKgICNpZmRlZiBDT05GSUdfQk9BUkRfRUFSTFlfSU5JVF9GCj4+PiAtc3RhdGljIHU4IGJy
ZGNvZGUgX19zZWN0aW9uKCJkYXRhIik7Cj4+PiAtc3RhdGljIHU4IGRkcjNjb2RlIF9fc2VjdGlv
bigiZGF0YSIpOwo+Pj4gLXN0YXRpYyB1OCBzb21jb2RlIF9fc2VjdGlvbigiZGF0YSIpOwo+Pj4g
K3N0YXRpYyB1OCBicmRjb2RlIF9fc2VjdGlvbigiLmRhdGEiKTsKPj4+ICtzdGF0aWMgdTggZGRy
M2NvZGUgX19zZWN0aW9uKCIuZGF0YSIpOwo+Pj4gK3N0YXRpYyB1OCBzb21jb2RlIF9fc2VjdGlv
bigiLmRhdGEiKTsKPj4+IMKgIHN0YXRpYyB1MzIgb3BwX3ZvbHRhZ2VfbXYgX19zZWN0aW9uKCIu
ZGF0YSIpOwo+Pj4gwqAgwqAgc3RhdGljIHZvaWQgYm9hcmRfZ2V0X2NvZGluZ19zdHJhcHModm9p
ZCkKPj4KPj4gQXBwbGllZCB0byB1LWJvb3Qtc3RtL25leHQKPiAKPiBTaW5jZSB0aGlzIGlzIGEg
YnVnZml4LCBzaG91bGQgYmUgZm9yIGN1cnJlbnQuCgpIaSBNYXJlawoKVW5mb3J0dW5hdGVseSB0
aGUgcHVsbCByZXF1ZXN0IGhhcyBhbHJlYWR5IHNlbnQgdG8gdGhlIG1haWxpbmcgbGlzdCA6LSgK
SSB3aWxsIHRha2UgY2FyZSBuZXh0IHRpbWUuCgpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
