Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0EC103AC7
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 14:11:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17551C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 13:11:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 321C4C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 13:11:23 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKD7Kh3024914; Wed, 20 Nov 2019 14:11:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bPcKLrGrjkOngYrBlTg77N8oIFVSE9OMtsdm++7UKlY=;
 b=m9q41DOQeI2IKmThF+xZZ+ZPmrzHfwB8yZ5oNQwrtaw/n5FD1KKCNorUDJgEJMroEhy2
 da0v9LL7zWtcB3nOCmseI+3DCFAEOLCa7nDaIq/xzx1z7RBsRMQpCBN+Ds8rHujvXkDg
 Yw4C1OtlAmuNp3zRJaEsC9AmqPn27VFIlnFyjuKxG8ardpkymbXQCRHPECoV+aaG6F01
 B9mFuf08hU5lTvz7lmkoMPEffJQ4ceaCx7d015Mp/by5eYuqQUaE2lxOpV/dnK3bC72k
 j98JNvJIDX9km45uE1pCKwP4P/Arh77Kn10TR21RxqTF8WpwyZnbG2DYKyoP6YNKR0rp fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9uj5thr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 14:11:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BAF0D10002A;
 Wed, 20 Nov 2019 14:11:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B1C602FF5C5;
 Wed, 20 Nov 2019 14:11:20 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 14:11:20 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 14:11:16 +0100
Message-ID: <20191120131116.20620-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120131116.20620-1-patrice.chotard@st.com>
References: <20191120131116.20620-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 2/2] video: bmp: Fix
	video_display_rle8_bitmap()
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

SW4gY2FzZSB0aGUgQk1QIHNpemUgaXMgYmlnZ2VyIHRoYW4gdGhlIGZyYW1lIGJ1ZmZlciwgZG9u
J3QgdXNlCnRoZSBCTVAncyB3aWR0aCBhbmQgaGVpZ2h0IGluIHZpZGVvX2Rpc3BsYXlfcmxlOF9i
aXRtYXAsIGJ1dCB0aGUKb25lJ3MgY2hlY2tlZCBpbiB2aWRlb19ibXBfZGlzcGxheSgpIGFzIHBh
cmFtZXRlcnMgdG8KdmlkZW9fZGlzcGxheV9ybGU4X2JpdG1hcCgpLgoKU2lnbmVkLW9mZi1ieTog
UGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPgpDQzogWWFubmljayBGZXJ0
csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgoKLS0tCgpDaGFuZ2VzIGluIHYyOiBOb25lCgog
ZHJpdmVycy92aWRlby92aWRlb19ibXAuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRl
by92aWRlb19ibXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMKaW5kZXggOTI4NDdhODA4
OC4uMGU3YjZiMjBhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYworKysg
Yi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCkBAIC00MCwxOCArNDAsMTYgQEAgc3RhdGljIHZv
aWQgZHJhd19lbmNvZGVkX2JpdG1hcCh1c2hvcnQgKipmYnAsIHVzaG9ydCBjb2wsIGludCBjbnQp
CiAKIHN0YXRpYyB2b2lkIHZpZGVvX2Rpc3BsYXlfcmxlOF9iaXRtYXAoc3RydWN0IHVkZXZpY2Ug
KmRldiwKIAkJCQkgICAgICBzdHJ1Y3QgYm1wX2ltYWdlICpibXAsIHVzaG9ydCAqY21hcCwKLQkJ
CQkgICAgICB1Y2hhciAqZmIsIGludCB4X29mZiwgaW50IHlfb2ZmKQorCQkJCSAgICAgIHVjaGFy
ICpmYiwgaW50IHhfb2ZmLCBpbnQgeV9vZmYsCisJCQkJICAgICAgdWxvbmcgd2lkdGgsIHVsb25n
IGhlaWdodCkKIHsKIAlzdHJ1Y3QgdmlkZW9fcHJpdiAqcHJpdiA9IGRldl9nZXRfdWNsYXNzX3By
aXYoZGV2KTsKIAl1Y2hhciAqYm1hcDsKLQl1bG9uZyB3aWR0aCwgaGVpZ2h0OwogCXVsb25nIGNu
dCwgcnVubGVuOwogCWludCB4LCB5OwogCWludCBkZWNvZGUgPSAxOwogCiAJZGVidWcoIiVzXG4i
LCBfX2Z1bmNfXyk7Ci0Jd2lkdGggPSBnZXRfdW5hbGlnbmVkX2xlMzIoJmJtcC0+aGVhZGVyLndp
ZHRoKTsKLQloZWlnaHQgPSBnZXRfdW5hbGlnbmVkX2xlMzIoJmJtcC0+aGVhZGVyLmhlaWdodCk7
CiAJYm1hcCA9ICh1Y2hhciAqKWJtcCArIGdldF91bmFsaWduZWRfbGUzMigmYm1wLT5oZWFkZXIu
ZGF0YV9vZmZzZXQpOwogCiAJeCA9IDA7CkBAIC0yNzcsNyArMjc1LDcgQEAgaW50IHZpZGVvX2Jt
cF9kaXNwbGF5KHN0cnVjdCB1ZGV2aWNlICpkZXYsIHVsb25nIGJtcF9pbWFnZSwgaW50IHgsIGlu
dCB5LAogCQkJCXJldHVybiAtRVBST1RPTk9TVVBQT1JUOwogCQkJfQogCQkJdmlkZW9fZGlzcGxh
eV9ybGU4X2JpdG1hcChkZXYsIGJtcCwgY21hcF9iYXNlLCBmYiwgeCwKLQkJCQkJCSAgeSk7CisJ
CQkJCQkgIHksIHdpZHRoLCBoZWlnaHQpOwogCQkJYnJlYWs7CiAJCX0KICNlbmRpZgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
