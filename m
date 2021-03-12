Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B0E338D26
	for <lists+uboot-stm32@lfdr.de>; Fri, 12 Mar 2021 13:34:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C764C57B55;
	Fri, 12 Mar 2021 12:34:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A04FC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 12:34:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12CCNCxV021431; Fri, 12 Mar 2021 13:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YstpJMtTkX2PBj/2p81olhT+WVZbKU0Silj0C2A/GkA=;
 b=6YeWFHHkXCWrpC1K0WUpV0+ne/AOpL3wA04Otlg63oJQ7R30USMT9eglAXTD2O/MRiH2
 0NimgK4lprZFKdvxq8L1Ca1G8hAV1HU3SvxOvTc8WdGsByEESQ3oiOY268iJCFnjXNGB
 R9DV1jndcX6cKkrif9b7Ldm0KfhBkI3LyTauXQMRxpcvq/MWe1qaQera4QZUEBiDs8dl
 yA6oBDebTKbVgC/HFVC50A+edu7WW6XciErILSc2oEHzmcK4v+QwjHVaRP6r9wB1vLEX
 dj7sEJTuumqI/2eDKK3VlRs9OZBg1PoHiz8O8xMitpvn9Nj1KGmB6vV6M0lI8zAqiHw1 gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374037d1km-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Mar 2021 13:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3576810002A;
 Fri, 12 Mar 2021 13:33:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2BB1F23DCD3;
 Fri, 12 Mar 2021 13:33:59 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 12 Mar
 2021 13:33:58 +0100
To: yannick Fertre <yannick.fertre@foss.st.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210304131413.1.I2cbb4b61852b8dd63bbad5b3a2a27857b59be7ab@changeid>
 <44c46998-7ea1-562a-a269-a89637962ca2@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d906415c-1690-1cd4-cd7f-cf8698b40f4f@foss.st.com>
Date: Fri, 12 Mar 2021 13:33:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <44c46998-7ea1-562a-a269-a89637962ca2@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-12_03:2021-03-10,
 2021-03-12 signatures=0
Cc: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] video: dw_mipi_dsi: missing device to
	log debug
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

SGkKCk9uIDMvNC8yMSAzOjU5IFBNLCB5YW5uaWNrIEZlcnRyZSB3cm90ZToKPiBBY2tlZC1ieTog
WWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+IAo+IAo+IE9uIDMv
NC8yMSAxOjE0IFBNLCBQYXRyaWNrIERlbGF1bmF5IHdyb3RlOgo+PiBGcm9tOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+Cj4+IE1pc3NpbmcgdWRldmljZSB0
byBzdHJ1Y3QgZHdfbWlwaV9kc2kgdG8gbG9nIHRyYWNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZ
YW5uaWNrIEZlcnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0t
LQo+Pgo+PiDCoCBkcml2ZXJzL3ZpZGVvL2R3X21pcGlfZHNpLmMgfCAxICsKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2R3X21pcGlfZHNpLmMgYi9kcml2ZXJzL3ZpZGVvL2R3X21pcGlfZHNpLmMKPj4gaW5kZXggNGRk
ZTY0ODgxNC4uYTViZWVkMzUxNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aWRlby9kd19taXBp
X2RzaS5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZHdfbWlwaV9kc2kuYwo+PiBAQCAtNzk3LDYg
Kzc5Nyw3IEBAIHN0YXRpYyBpbnQgZHdfbWlwaV9kc2lfaW5pdChzdHJ1Y3QgdWRldmljZSAqZGV2
LAo+PiDCoMKgwqDCoMKgIGRzaS0+cGh5X29wcyA9IHBoeV9vcHM7Cj4+IMKgwqDCoMKgwqAgZHNp
LT5tYXhfZGF0YV9sYW5lcyA9IG1heF9kYXRhX2xhbmVzOwo+PiDCoMKgwqDCoMKgIGRzaS0+ZGV2
aWNlID0gZGV2aWNlOwo+PiArwqDCoMKgIGRzaS0+ZHNpX2hvc3QuZGV2ID0gKHN0cnVjdCBkZXZp
Y2UgKilkZXY7Cj4+IMKgwqDCoMKgwqAgZHNpLT5kc2lfaG9zdC5vcHMgPSAmZHdfbWlwaV9kc2lf
aG9zdF9vcHM7Cj4+IMKgwqDCoMKgwqAgZGV2aWNlLT5ob3N0ID0gJmRzaS0+ZHNpX2hvc3Q7Cj4+
IMKgCkFwcGxpZWQgdG8gdS1ib290LXN0bS9uZXh0CgpUaGFua3MKClBhdHJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
