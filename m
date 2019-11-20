Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD81037CC
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 11:44:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27713C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 10:44:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9D03C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:44:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKAR8Mo022813; Wed, 20 Nov 2019 11:44:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=TRV65jCWMdSNjAsPeZj/Hoy4I4w6DoeJVhjJdIG2dTo=;
 b=wz+Qqc37aBiL95LfGKPgdssHpTj4b2nBT4cpQ9Afh7ynXdZa6hqWU8prbC6lDHLuCzrK
 hKoEOw4bPbRDktm0wK2v7pVR2jnHob3F4iNrSEmjDYfHI/N2OBO/IlIJpAbP8y7PcjfI
 g1S+s3+X9NqV4UUPIyiZZRUGpnbH0gdUjpqTyGKJI/oLVJlO0MbnpOKREtuRO8KMPFXt
 ZnqwgLlyEG7oaj+XJO3XfnBtCRMiekVZEPaifLL5/dWNyKDsoDggYQU1KzyemYS7qRw/
 WKyx25xsYliMszXdT7d+lCeV/YjiohxxlajztajFQcnWAXFobnI4T9Eul2V2SXR7Y6JE 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usd71x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:44:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0141510002A;
 Wed, 20 Nov 2019 11:44:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9E092BE235;
 Wed, 20 Nov 2019 11:44:26 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 11:44:26 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 11:44:17 +0100
Message-ID: <20191120104418.1179-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120104418.1179-1-patrice.chotard@st.com>
References: <20191120104418.1179-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] video: bmp: Fix video_splash_align_axis()
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

SW4gY2FzZSB0aGUgcGFuZWxfc2l6ZSBpcyBzbWFsbGVyIHRoYW4gcGljdHVyZV9zaXplLCB3ZSBt
dXN0IGluc3VyZQp0aGF0IHBhbmVsX3BpY3R1cmVfZGVsdGEgc3RvcmVzIHRoZSBhYnNvbHV0ZSB2
YWx1ZSBvZiBkaWZmZXJlbmNlCmJldHdlZW4gcGFuZWxfc2l6ZSBhbmQgcGljdHVyZV9zaXplLgoK
U2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgpD
QzogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQoKIGRyaXZlcnMv
dmlkZW8vdmlkZW9fYm1wLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGIv
ZHJpdmVycy92aWRlby92aWRlb19ibXAuYwppbmRleCAxOTNmMzdkMjc1Li5kYzYyNThjZTc4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCisrKyBiL2RyaXZlcnMvdmlkZW8v
dmlkZW9fYm1wLmMKQEAgLTE1Nyw3ICsxNTcsNyBAQCBfX3dlYWsgdm9pZCBmYl9wdXRfd29yZCh1
Y2hhciAqKmZiLCB1Y2hhciAqKmZyb20pCiBzdGF0aWMgdm9pZCB2aWRlb19zcGxhc2hfYWxpZ25f
YXhpcyhpbnQgKmF4aXMsIHVuc2lnbmVkIGxvbmcgcGFuZWxfc2l6ZSwKIAkJCQkgICAgdW5zaWdu
ZWQgbG9uZyBwaWN0dXJlX3NpemUpCiB7Ci0JdW5zaWduZWQgbG9uZyBwYW5lbF9waWN0dXJlX2Rl
bHRhID0gcGFuZWxfc2l6ZSAtIHBpY3R1cmVfc2l6ZTsKKwl1bnNpZ25lZCBsb25nIHBhbmVsX3Bp
Y3R1cmVfZGVsdGEgPSBhYnMocGFuZWxfc2l6ZSAtIHBpY3R1cmVfc2l6ZSk7CiAJdW5zaWduZWQg
bG9uZyBheGlzX2FsaWdubWVudDsKIAogCWlmICgqYXhpcyA9PSBCTVBfQUxJR05fQ0VOVEVSKQot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
