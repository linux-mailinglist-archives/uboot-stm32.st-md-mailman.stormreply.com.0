Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B281037CD
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 11:44:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E894C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 10:44:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6622C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 10:44:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKAR6SI022777; Wed, 20 Nov 2019 11:44:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2JB9pUvxV9YH6Mm0ztlYUtpItVMWXLj04flYZQc2x+Q=;
 b=T/pIJHIaahd9pj/GWcftWdjA3Bsuo7BAPnVEa4VpTKoC9tFdzmk/7+ANRT8W0W0FES3p
 F+52FTUJYWrFQyyvyhR6ZS52Tm4iwesXojVoHsqx1uvJ9jnmNqiuzGyRye6xFXoAeMGY
 1qSjo0l38dSgZ4lL8ITaH7x2/mK4Hq72t4C4NAYKIOLSUjHlKtbouSt1FVRsNqTDnong
 cRs6Y440mklES6DITgz+wC1UduwjUHBD/pqUuF0/3tfGRl9X0mO52vChM+2t3ACtrYQK
 tYEeErtOV5WYD29tIswoLUeLyGf1WEOZK7QHPpncsz47u+Dg81fEL7RnZUhCRDvCSiVb iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usd721-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 11:44:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF30710002A;
 Wed, 20 Nov 2019 11:44:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C5BB42BE235;
 Wed, 20 Nov 2019 11:44:27 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 11:44:27 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 11:44:18 +0100
Message-ID: <20191120104418.1179-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120104418.1179-1-patrice.chotard@st.com>
References: <20191120104418.1179-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_02:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] video: bmp: Fix
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
csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+CgotLS0KCiBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2Jt
cC5jIHwgOCArKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIGIvZHJpdmVy
cy92aWRlby92aWRlb19ibXAuYwppbmRleCBkYzYyNThjZTc4Li5mM2E2ZDA0NjgyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9f
Ym1wLmMKQEAgLTQwLDE4ICs0MCwxNiBAQCBzdGF0aWMgdm9pZCBkcmF3X2VuY29kZWRfYml0bWFw
KHVzaG9ydCAqKmZicCwgdXNob3J0IGNvbCwgaW50IGNudCkKIAogc3RhdGljIHZvaWQgdmlkZW9f
ZGlzcGxheV9ybGU4X2JpdG1hcChzdHJ1Y3QgdWRldmljZSAqZGV2LAogCQkJCSAgICAgIHN0cnVj
dCBibXBfaW1hZ2UgKmJtcCwgdXNob3J0ICpjbWFwLAotCQkJCSAgICAgIHVjaGFyICpmYiwgaW50
IHhfb2ZmLCBpbnQgeV9vZmYpCisJCQkJICAgICAgdWNoYXIgKmZiLCBpbnQgeF9vZmYsIGludCB5
X29mZiwKKwkJCQkgICAgICB1bG9uZyB3aWR0aCwgdWxvbmcgaGVpZ2h0KQogewogCXN0cnVjdCB2
aWRlb19wcml2ICpwcml2ID0gZGV2X2dldF91Y2xhc3NfcHJpdihkZXYpOwogCXVjaGFyICpibWFw
OwotCXVsb25nIHdpZHRoLCBoZWlnaHQ7CiAJdWxvbmcgY250LCBydW5sZW47CiAJaW50IHgsIHk7
CiAJaW50IGRlY29kZSA9IDE7CiAKIAlkZWJ1ZygiJXNcbiIsIF9fZnVuY19fKTsKLQl3aWR0aCA9
IGdldF91bmFsaWduZWRfbGUzMigmYm1wLT5oZWFkZXIud2lkdGgpOwotCWhlaWdodCA9IGdldF91
bmFsaWduZWRfbGUzMigmYm1wLT5oZWFkZXIuaGVpZ2h0KTsKIAlibWFwID0gKHVjaGFyICopYm1w
ICsgZ2V0X3VuYWxpZ25lZF9sZTMyKCZibXAtPmhlYWRlci5kYXRhX29mZnNldCk7CiAKIAl4ID0g
MDsKQEAgLTI3Nyw3ICsyNzUsNyBAQCBpbnQgdmlkZW9fYm1wX2Rpc3BsYXkoc3RydWN0IHVkZXZp
Y2UgKmRldiwgdWxvbmcgYm1wX2ltYWdlLCBpbnQgeCwgaW50IHksCiAJCQkJcmV0dXJuIC1FUFJP
VE9OT1NVUFBPUlQ7CiAJCQl9CiAJCQl2aWRlb19kaXNwbGF5X3JsZThfYml0bWFwKGRldiwgYm1w
LCBjbWFwX2Jhc2UsIGZiLCB4LAotCQkJCQkJICB5KTsKKwkJCQkJCSAgeSwgd2lkdGgsIGhlaWdo
dCk7CiAJCQlicmVhazsKIAkJfQogI2VuZGlmCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
