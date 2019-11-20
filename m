Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF5103AC5
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 14:11:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AAD8C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 13:11:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE4CEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 13:11:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAKD71tN022357; Wed, 20 Nov 2019 14:11:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=knKrZIIze7ljBxf3yCXdpiB4XSe1oWi8uTlAHnv9iUc=;
 b=zlXk1UiMMVGvsanPtBKzkfpwh8/xL2eZ6b1q0NqJXUZqwKIXSr0O0WBGh+thPFnUykS6
 PLXsi1OWBWtC36CLASrp9SSrH1p1iKQYbB5jdOvOJdf/QzgfppCK2XbfQhLyyIX5OaLJ
 XV7w/tXFsshZK9sVmoMIRTM2L5rVX3TIGax5Qy6PmvpqleFMKisHMAQ68LClcVVO88SQ
 E7WLvBslx6gn5Uz7DC0yVZ3VvljfJ1ON3kVPnLbDEvhlSn2NkgYrPpV5jFK97UF8BvJi
 lvQlIil9k+ELXYLHISGyLuU3qukGidGw2CfoHVsOs5qvmyeYaDjC2YPPOknMD52wFgLv Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wa9usdtvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Nov 2019 14:11:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEABC100034;
 Wed, 20 Nov 2019 14:11:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6F762FF5C4;
 Wed, 20 Nov 2019 14:11:19 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 20 Nov 2019 14:11:19 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Nov 2019 14:11:15 +0100
Message-ID: <20191120131116.20620-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120131116.20620-1-patrice.chotard@st.com>
References: <20191120131116.20620-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_03:2019-11-15,2019-11-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>,
 Anatolij Gustschin <agust@denx.de>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/2] video: bmp: Fix
	video_splash_align_axis()
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

Q29udmVydCBwYW5lbF9waWN0dXJlX2RlbHRhIGZyb20gdW5zaWduZWQgbG9uZyB0byBsb25nIHRv
IGluc3VyZQp0byBzdG9yZSBjb3JyZWN0bHkgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBwYW5lbF9z
aXplIGFuZCBwaWN0dXJlX3NpemUKaW4gY2FzZSB0aGUgcGFuZWxfc2l6ZSBpcyBzbWFsbGVyIHRo
YW4gcGljdHVyZV9zaXplLgoKU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNl
LmNob3RhcmRAc3QuY29tPgpDQzogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5j
b20+CgotLS0KCkNoYW5nZXMgaW4gdjI6CiAgICAgLSBDb252ZXJ0IHBhbmVsX3BpY3R1cmVfZGVs
dGEgZnJvbSB1bnNpZ25lZCBsb25nIHRvIGxvbmcKCiBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlk
ZW9fYm1wLmMKaW5kZXggMTkzZjM3ZDI3NS4uOTI4NDdhODA4OCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby92aWRlb19ibXAuYworKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCkBAIC0x
NTcsNyArMTU3LDcgQEAgX193ZWFrIHZvaWQgZmJfcHV0X3dvcmQodWNoYXIgKipmYiwgdWNoYXIg
Kipmcm9tKQogc3RhdGljIHZvaWQgdmlkZW9fc3BsYXNoX2FsaWduX2F4aXMoaW50ICpheGlzLCB1
bnNpZ25lZCBsb25nIHBhbmVsX3NpemUsCiAJCQkJICAgIHVuc2lnbmVkIGxvbmcgcGljdHVyZV9z
aXplKQogewotCXVuc2lnbmVkIGxvbmcgcGFuZWxfcGljdHVyZV9kZWx0YSA9IHBhbmVsX3NpemUg
LSBwaWN0dXJlX3NpemU7CisJbG9uZyBwYW5lbF9waWN0dXJlX2RlbHRhID0gcGFuZWxfc2l6ZSAt
IHBpY3R1cmVfc2l6ZTsKIAl1bnNpZ25lZCBsb25nIGF4aXNfYWxpZ25tZW50OwogCiAJaWYgKCph
eGlzID09IEJNUF9BTElHTl9DRU5URVIpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
