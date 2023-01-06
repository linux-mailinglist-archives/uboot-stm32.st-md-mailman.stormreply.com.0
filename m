Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AEE65FF24
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 11:49:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C933C69066;
	Fri,  6 Jan 2023 10:49:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13069C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 10:49:06 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3068YoY5006314; Fri, 6 Jan 2023 11:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=kgg2y84WfKJhwYaK36bytfMMZMBEQn7q5Kpyk2zeAjM=;
 b=TMEcc7EuBlCYGupaffOxGgCUAbvjuwMXWi9Y9ONYo+W+yIXipMreNqcKwpftQt8sfVRU
 HlbERSJL2aVXUcjfBuimyLP+FYQd2p/GH3EdF54keIAf96pSgGx9EkAHVQhFCvoXB0on
 KzgZDEYWE1ntqlaL9v6jBNys1xDxNUlTrVYZW2svWzNYWzksgadvhcfeYqHOhmqiEHxX
 YUtIFb7wMRKT3+TYGvVdBzhtWZEpAQFegEhWRHXk1iJ7rl+m9g6ITMkoinph7agulyUJ
 zTaGtPEa3/HGMv3+017BYAp/t9p7SenDlHWFyC/Q6/wBzC2HGYifcKaFBTBDhbAb5s0t ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtbcqf17x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 11:49:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0161210002A;
 Fri,  6 Jan 2023 11:48:58 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 24EB320DB71;
 Fri,  6 Jan 2023 11:48:58 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 11:48:55 +0100
Message-ID: <348bc74e-fb7c-3911-680a-b6dff96a70b4@foss.st.com>
Date: Fri, 6 Jan 2023 11:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-06_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2023.01 =
 u-boot-stm32-20230106
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

SGkgVG9tLAoKUGxlYXNlIHB1bGwgdGhlIFNUTTMyIHJlbGF0ZWQgZml4ZXMgZm9yIHUtYm9vdC9t
YXN0ZXIsIHYyMDIzLjAxOiAKdS1ib290LXN0bTMyLTIwMjMwMTA2CgoKLSBzdG0zMm1wOiBGaXgg
Ym9hcmRfZ2V0X3VzYWJsZV9yYW1fdG9wKCk6IHdvcmthcm91bmQgdG8gYXZvaWQgaXNzdWUgCmFm
dGVyIHRoZQoKIMKgIGNvbW1pdCA3NzdhYWFhNzA2YiAoImNvbW1vbi9tZW1zaXplLmM6IEZpeCBn
ZXRfZWZmZWN0aXZlX21lbXNpemUoKSB0byAKY2hlY2sKCiDCoCBmb3Igb3ZlcmZsb3ciKSBiZWNh
dXNlIHRoZSBlZmZlY3RpdmUgRERSIGVmZmVjdGl2ZSBzaXplIGlzIHJlZHVjZSBieSA0S2lCCiDC
oCBhbmQgc29tZXRpbWUgdGhlIGJvYXJkIGhhbmcgb24gYm9vdAoKCkNJIHN0YXR1czogCmh0dHBz
Oi8vc291cmNlLmRlbnguZGUvdS1ib290L2N1c3RvZGlhbnMvdS1ib290LXN0bS8tL3BpcGVsaW5l
cy8xNDYyMwoKClRoaXMgbGFzdCBwYXRjaCBmb3IgdjIwMjMuMDEgYXZvaWRzIGEgaGFuZyBvbiAx
R0IgRERSIFNUTTMyTVAxNSBib2FyZCAKZGV0ZWN0ZWQKCmJ5IE1hcmVrIGFuZCBjYXVzZWQgYnkg
UGFsaSBwYXRjaC4KCgpGb3IgbXkgcG9pbnQgYSB2aWV3ICwgdGhpcyBwYXRjaCBpcyBhbiBhY2Nl
cHRhYmxlIHdvcmthcm91bmQgZm9yIG1hc3RlciAKYnJhbmNoIGFuZCB2MjAyMy4wMSBkZWxpdmVy
eQoKYnV0IHRoZSBpbml0aWFsIHBhdGNoIHNob3VsZCBiZSByZXZpc2l0ZWQgb3IgcmV2ZXJ0ZWQg
KGluIG1hc3RlciBvciBpbiAKbmV4dCA/KS4KCgpGb3IgZGV0YWlscyBzZWUgY29tbWVudHMgaW4g
cGF0Y2gKCiJhcm06IHN0bTMybXA6IEZpeCBib2FyZF9nZXRfdXNhYmxlX3JhbV90b3AoKSBhZ2Fp
biIKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjMw
MTA1MDEyMjIyLjIzODA3NS0xLW1hcmV4QGRlbnguZGUvCgpodHRwczovL2xvcmUua2VybmVsLm9y
Zy91LWJvb3QvMjAyMzAxMDUwMTIyMjIuMjM4MDc1LTEtbWFyZXhAZGVueC5kZS8KCgpUaGFua3Ms
ClBhdHJpY2sKCj09PT09CgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4ZDZj
YmY1ZTZiYzRlMTBlMzhiOTU0NzYzZmEwMjVjYWVkNTE3Y2MyOgoKIMKgIE1lcmdlIHRhZyAnZWZp
LTIwMjMtMDEtcmM1LTMnIG9mIApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2Rp
YW5zL3UtYm9vdC1lZmkgKDIwMjMtMDEtMDQgMDg6NTA6MjQgCi0wNTAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91
LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLmdpdCAKdGFncy91LWJvb3Qtc3RtMzItMjAyMzAx
MDYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhMmUwYjA0MWQ2NjJlNGM4MDUwMmNk
NWM5YTgzMjZkMDI2ZjlkZWIxOgoKIMKgIGFybTogc3RtMzJtcDogRml4IGJvYXJkX2dldF91c2Fi
bGVfcmFtX3RvcCgpIGFnYWluICgyMDIzLTAxLTA2IAoxMTowMjoxNyArMDEwMCkKCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
LSBzdG0zMm1wOiBGaXggYm9hcmRfZ2V0X3VzYWJsZV9yYW1fdG9wKCk6IHdvcmthcm91bmQgdG8g
YXZvaWQgaXNzdWUgCmFmdGVyIHRoZQogwqAgY29tbWl0IDc3N2FhYWE3MDZiICgiY29tbW9uL21l
bXNpemUuYzogRml4IGdldF9lZmZlY3RpdmVfbWVtc2l6ZSgpIHRvIApjaGVjawogwqAgZm9yIG92
ZXJmbG93IikgYmVjYXVzZSB0aGUgZWZmZWN0aXZlIEREUiBlZmZlY3RpdmUgc2l6ZSBpcyByZWR1
Y2UgYnkgNEtpQgogwqAgYW5kIHNvbWV0aW1lIHRoZSBib2FyZCBoYW5nIG9uIGJvb3QKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KTWFyZWsgVmFzdXQgKDEpOgogwqDCoMKgwqDCoCBhcm06IHN0bTMybXA6IEZpeCBib2FyZF9n
ZXRfdXNhYmxlX3JhbV90b3AoKSBhZ2FpbgoKIMKgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2RyYW1f
aW5pdC5jIHwgMiArLQogwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
