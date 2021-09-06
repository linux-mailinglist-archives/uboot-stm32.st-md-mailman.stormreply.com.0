Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB2401B17
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Sep 2021 14:23:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34443C59781;
	Mon,  6 Sep 2021 12:23:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F097C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Sep 2021 12:23:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1868ZgDq021195;
 Mon, 6 Sep 2021 14:23:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=to : cc : from :
 subject : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=QAEiV9/ieCPgPKzKWxa6ZkKsR92pmP/Wg+FEaaff+B0=;
 b=b5jp908lJzuXkjpGeY72WYbNo2U65NpHXtmy//W/qAtkbi/RE9J0nN3nZFhoPUHBONKY
 vX+RZwJlLv7m3p6tVeiyw+UUP4q/0C4xcwn68Qi5pNDvf7/31/WLobM06tDiTkh2Y/4K
 0hwN5cmGlsmTQasTUVoITcs1+KS+21mrKSphZFgwChcwMG8M6ibRNQBR1W2+m5VKkyAU
 Jm4mDQWOPSNnExRttVB04FAle1j4inxqJUDH4r4KylFYX7+vcCF9+MCzbEyqicb2ExdZ
 HhvKcVjoyo8v8QAcNS6gU5imsU+wO+RlT/1yfwJ49NpRUTXO8vEeByzU0jolNfWk98YU Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3aw9kdk1ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 14:23:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 88D5710002A;
 Mon,  6 Sep 2021 14:23:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7323B226FA7;
 Mon,  6 Sep 2021 14:23:26 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 6 Sep
 2021 14:23:26 +0200
To: Tom Rini <trini@konsulko.com>, U-Boot Mailing List <u-boot@lists.denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <8d7790a9-82d0-9470-78a4-fe836d1280f9@foss.st.com>
Date: Mon, 6 Sep 2021 14:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_05,2021-09-03_01,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PULL] Pull request for u-boot master / v2021.10 =
 u-boot-stm32-20210906
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
YXN0ZXIsIHYyMDIxLjEwOiAKdS1ib290LXN0bTMyLTIwMjEwOTA2CgotIGZpeCBFRkkgYm9vdCB3
aXRoIE9QLVRFRSBmb3IgU1RNMzJNUDE1IGJvYXJkcwoKQ0kgc3RhdHVzOiAKaHR0cHM6Ly9zb3Vy
Y2UuZGVueC5kZS91LWJvb3QvY3VzdG9kaWFucy91LWJvb3Qtc3RtLy0vcGlwZWxpbmVzLzkwMDYK
ClRoYW5rcywKUGF0cmljawoKZ2l0IHJlcXVlc3QtcHVsbCBvcmlnaW4vbWFzdGVyIApodHRwczov
L3NvdXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0LyAKdS1ib290
LXN0bTMyLTIwMjEwOTA2CgoKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgZWNk
NmUwY2U1YWFlZWIxMTQ5YjBiOGViZTZiZWQ4MTk4ZDBiZDJmZToKCiDCoCBNZXJnZSB0YWcgJ3hp
bGlueC1mb3ItdjIwMjEuMTAtcmM0JyBvZiAKaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3Qv
Y3VzdG9kaWFucy91LWJvb3QtbWljcm9ibGF6ZSAoMjAyMS0wOS0wMyAKMTM6MTc6NDMgLTA0MDAp
CgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDCoCBodHRwczovL3Nv
dXJjZS5kZW54LmRlL3UtYm9vdC9jdXN0b2RpYW5zL3UtYm9vdC1zdG0uZ2l0LyAKdGFncy91LWJv
b3Qtc3RtMzItMjAyMTA5MDYKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjODUxMGUz
OTdmYWQ0MDU2NjE5ZDJkYWI2ZjJiNjFjNDg3NjZhMjM5OgoKIMKgIHN0bTMybXA6IEZpeCBib2Fy
ZF9nZXRfdXNhYmxlX3JhbV90b3AoKSAoMjAyMS0wOS0wNiAxMDowMDoxMSArMDIwMCkKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KLSBmaXggRUZJIGJvb3Qgd2l0aCBPUC1URUUgZm9yIFNUTTMyTVAxNSBib2FyZHMKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KUGF0cmljZSBDaG90YXJkICgxKToKIMKgwqDCoMKgwqAgc3RtMzJtcDogRml4IGJvYXJkX2dl
dF91c2FibGVfcmFtX3RvcCgpCgogwqBhcmNoL2FybS9tYWNoLXN0bTMybXAvZHJhbV9pbml0LmMg
fCAyICstCiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
