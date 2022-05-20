Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6952E63B
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:25:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C01ACC56630;
	Fri, 20 May 2022 07:25:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E083EC5662F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:25:21 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1bYoT020575;
 Fri, 20 May 2022 09:25:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=DdGpxn7Bz4cDx+Q+hpF1rNm3egUcick4E6REu3oLyq4=;
 b=4tNY4iznOHHgut0V8rJxZUU6jb3WLvhjVdX9yGWZNZl2YUJcuawi0AceT/E9an3Tl4ip
 CpfYfUjY/yclIQ6UAhvbMOQB+OVT394PbcTs+xiEp+oXvrpsrhnSG+mgJQ+uNjytSwU4
 4jwKODcT+IPhu5XoFl+jfdSGq9+UTFQ1fMjisj6G/HN45b2P7mDtP/i2rEa/G9sR1uX3
 yP5kDN9bsNtuLYf+ltvG9hUOw7Qfaz49RG2Im9gC7E6if3XM+z3XeQemtQF5zEu/VI0b
 L2RZK5IXwbOC9mqmBLVx6u8OgWa45ME/eC4zR+tYeknpOoQX+i+DFiCzmHOMLKT/grug 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj6f2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:25:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3010210003B;
 Fri, 20 May 2022 09:25:20 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2315B212FBC;
 Fri, 20 May 2022 09:25:20 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.49) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:25:17 +0200
Message-ID: <174e5807-917a-7363-2daa-93c90ac9a118@foss.st.com>
Date: Fri, 20 May 2022 09:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, Marek Vasut <marex@denx.de>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2022.07 =
 u-boot-stm32-20220520
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
YXN0ZXIsIHYyMDIyLjA3OiAKdS1ib290LXN0bTMyLTIwMjIwNTIwCgotIHNwaTogZml4IGJ1c3kg
Yml0IGNoZWNrIGluIHN0bTMyX3FzcGkgZHJpdmVyCi0gc3RtMzJtcDE1OiBjb25maWd1cmUgQnVj
azMgdm9sdGFnZSBwZXIgUE1JQyBOVk0gb24gQXZlbmdlcjk2IGJvYXJkCgpDSSBzdGF0dXM6IApo
dHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0vLS9waXBl
bGluZXMvMTIwNDMKClRoYW5rcywKUGF0cmljawoKZ2l0IHJlcXVlc3QtcHVsbCBvcmlnaW4vbWFz
dGVyIApodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0u
Z2l0LyAKdS1ib290LXN0bTMyLTIwMjIwNTIwCgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQgZjgzYmQyM2UyYTBlOTg2MTk2OWM5ZDQzMzk1Mjk5YTE0ZjI1ZGRkYToKCiDCoCBN
ZXJnZSBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1tYXJ2
ZWxsIAooMjAyMi0wNS0xOCAwODo0MToxMyAtMDQwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0OgoKIMKgIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L2N1c3Rv
ZGlhbnMvdS1ib290LXN0bS5naXQvIAp0YWdzL3UtYm9vdC1zdG0zMi0yMDIyMDUyMAoKZm9yIHlv
dSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGI2YTQ2OTM2MGEwZGVjMDFkYmJmMDg3YzUxODRhNTlk
ZGE0OTQ1Njk6CgogwqAgc3BpOiBzdG0zMl9xc3BpOiBSZW1vdmUgU1JfQlVTWSBiaXQgY2hlY2sg
YmVmb3JlIHNlbmRpbmcgY29tbWFuZCAKKDIwMjItMDUtMTkgMTg6NTQ6MTggKzAyMDApCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCi0gc3BpOiBmaXggYnVzeSBiaXQgY2hlY2sgaW4gc3RtMzJfcXNwaSBkcml2ZXIKLSBzdG0z
Mm1wMTU6IGNvbmZpZ3VyZSBCdWNrMyB2b2x0YWdlIHBlciBQTUlDIE5WTSBvbiBBdmVuZ2VyOTYg
Ym9hcmQKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KTWFyZWsgVmFzdXQgKDEpOgogwqDCoMKgwqDCoCBBUk06IGR0czogc3Rt
MzI6IENvbmZpZ3VyZSBCdWNrMyB2b2x0YWdlIHBlciBQTUlDIE5WTSBvbiBBdmVuZ2VyOTYKClBh
dHJpY2UgQ2hvdGFyZCAoMik6CiDCoMKgwqDCoMKgIHNwaTogc3RtMzJfcXNwaTogQWx3YXlzIGNo
ZWNrIFNSX1RDRiBmbGFncyBpbiBzdG0zMl9xc3BpX3dhaXRfY21kKCkKIMKgwqDCoMKgwqAgc3Bp
OiBzdG0zMl9xc3BpOiBSZW1vdmUgU1JfQlVTWSBiaXQgY2hlY2sgYmVmb3JlIHNlbmRpbmcgY29t
bWFuZAoKIMKgYXJjaC9hcm0vZHRzL3N0bTMybXAxNXh4LWRoY29yLWlvMXY4LmR0c2kgfMKgwqAg
MiArLQogwqBib2FyZC9kaGVsZWN0cm9uaWNzL2RoX3N0bTMybXAxL2JvYXJkLmPCoMKgIHwgMTA5
IAorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiDC
oGRyaXZlcnMvc3BpL3N0bTMyX3FzcGkuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDI3IAorKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIMKgMyBmaWxlcyBjaGFuZ2Vk
LCAxMTggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJv
b3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
