Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B84822EBD84
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jan 2021 13:12:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C683C56634;
	Wed,  6 Jan 2021 12:12:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE5ABC5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jan 2021 12:12:31 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 106C7gfG023800; Wed, 6 Jan 2021 13:12:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=bcJeirHdQrCznVk6CuuZEYM76ByzBzPzcmzNwqbO1jk=;
 b=GH4lazdXOEmEuK3DYzRgUfDR80AZxfGhZvskEYOATglez0suXk2XdfC41Duam8UL/KQV
 rolZPD+Xs3XklY/j96wFmJ+HFgXgukVSoafayfT3JbppjUMU/HQeKA6bI4yUKXL+9nr4
 mVRtjWOp9C2ZWSqM0mP+MgdDKPOJHn89ytqAYFnHnfO2t/6AR/ZIXzoP92t3NDImZFiT
 DdEvektLJKYGaJo76EH7EkanRXA5Tq+4LTFyneRGGvIch6gSi+fg6lKF+ZiJ3b2TgWiy
 WdupMfk+CYh9HsFho9ciB3G8P5bi/GCpRDgLEQdNklM73lwAxdit+P1KfnQPPMmzTSfB 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35tf672vw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Jan 2021 13:12:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E6F5610002A;
 Wed,  6 Jan 2021 13:12:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D26DE24E772;
 Wed,  6 Jan 2021 13:12:26 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Jan
 2021 13:12:26 +0100
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
Message-ID: <e362403d-b543-cd5c-1edb-41aa3afba728@foss.st.com>
Date: Wed, 6 Jan 2021 13:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_06:2021-01-06,
 2021-01-06 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.01 =
 u-boot-stm32-20210106
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

CkhpIFRvbSwKClBsZWFzZSBwdWxsIHRoZSBsYXRlc3QgU1RNMzIgcmVsYXRlZCBwYXRjaGVzIGZv
ciB1LWJvb3QvbWFzdGVyLCAKdjIwMjEuMDE6IHUtYm9vdC1zdG0zMi0yMDIxMDEwNgoKLSBGaXgg
R1BJTyBob2cgZmxhZ3Mgb24gREhDT00gYm9hcmRzCgpDSSBzdGF0dXM6IApodHRwczovL2dpdGxh
Yi5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0vLS9waXBlbGluZXMvNTc2NAoK
VGhhbmtzLApQYXRyaWNrCgpnaXQgcmVxdWVzdC1wdWxsIG9yaWdpbi9tYXN0ZXIgCmh0dHBzOi8v
Z2l0bGFiLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS5naXQgCnUtYm9vdC1z
dG0zMi0yMDIxMDEwNgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA2MmIwN2I1
MTczZTNkMDRmYWJmYWM0MmNmMWY0Nzc5ZDAyMWY5NGFkOgoKIMKgIFByZXBhcmUgdjIwMjEuMDEt
cmM1ICgyMDIxLTAxLTA1IDA3OjMwOjM5IC0wNTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvY3VzdG9k
aWFucy91LWJvb3Qtc3RtLmdpdCAKdGFncy91LWJvb3Qtc3RtMzItMjAyMTAxMDYKCmZvciB5b3Ug
dG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBlYzRlZmQ1YWU3MjRjNTFjZjQwNDM3ZmE0YzZiZDc1OGQz
ODE2YmNkOgoKIMKgIEFSTTogZHRzOiBzdG0zMjogRml4IEdQSU8gaG9nIGZsYWdzIG9uIERIQ09N
IERSQzAyICgyMDIxLTAxLTA2IAoxMTowMTozMSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KLSBGaXggR1BJTyBo
b2cgZmxhZ3Mgb24gREhDT00gYm9hcmRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCk1hcmVrIFZhc3V0ICgyKToKIMKgwqDC
oMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBGaXggR1BJTyBob2cgZmxhZ3Mgb24gREhDT00gUGljb0lU
WAogwqDCoMKgwqDCoCBBUk06IGR0czogc3RtMzI6IEZpeCBHUElPIGhvZyBmbGFncyBvbiBESENP
TSBEUkMwMgoKIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLWRyYzAyLmR0c8KgwqAg
fCA0ICsrLS0KIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29tLXBpY29pdHguZHRzIHwg
MiArLQogwqAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0
bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vi
b290LXN0bTMyCg==
