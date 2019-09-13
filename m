Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3CB1B2A
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48D7AC35E04
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A843C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9k4Zs018562; Fri, 13 Sep 2019 11:48:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=PrPLGhLpgK7o28D8pcJtqjEhVRDlpcQhW4tcvxPyTA8=;
 b=yFL/rd/tYV3b7sxPntRpJp5B4KlknwZfUJsuhT3KDJ5i/WhczB7rejHEsjYJTq4CKF0J
 jgIlswHeSOEGREy39v9PinkOJOHeWaWQ/LCqiPOVyFd4JH14FyI6d66C47j8d8qa+Pwm
 NVxmEzDofuKJflvyHMsBaRZz+Da/wpSnB3fcWAwGhgpoD/zFsraYH1Q3vt0S8V6ugQLz
 FuoF+W1A2bPi6Gz5jIVyAXDpk93zbjhhMcMMnx35ghjfUneBDbZ7/WCdffy01PtNXUHn
 HiT9crWtd0OYXkjkAVaU0Lw1y8M2YKUfm+tccLqVcJV0kYHAjdUBBkg7SUkTGh0E0a8i oA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uytdx468v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BC35122;
 Fri, 13 Sep 2019 09:48:26 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 289182BB888;
 Fri, 13 Sep 2019 11:48:26 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:25 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:24
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Fri, 13 Sep 2019 11:47:49 +0200
Message-ID: <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 01/15] video: bmp: check resolutions of
	panel/bitmap
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

SWYgdGhlIHNpemUgb2YgdGhlIGJpdG1hcCBpcyBiaWdnZXIgdGhhbiB0aGUgc2l6ZSBvZgp0aGUg
cGFuZWwgdGhlbiBlcnJvcnMgYXBwZWFyIHdoZW4gY2FsY3VsYXRpbmcgYXhpcyBhbGlnbm1lbnQK
YW5kIHRoZSBjb3B5IG9mIGJpdG1hcCBpcyBkb25lIG91dHNpZGUgb2YgZnJhbWVidWZmZXIuCgpT
aWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0t
CiBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby92aWRl
b19ibXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMKaW5kZXggMTkzZjM3ZC4uNTQ0YmQ1
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL3ZpZGVvX2JtcC5jCkBAIC01NCw2ICs1NCwxMyBAQCBzdGF0aWMgdm9pZCB2aWRlb19kaXNw
bGF5X3JsZThfYml0bWFwKHN0cnVjdCB1ZGV2aWNlICpkZXYsCiAJaGVpZ2h0ID0gZ2V0X3VuYWxp
Z25lZF9sZTMyKCZibXAtPmhlYWRlci5oZWlnaHQpOwogCWJtYXAgPSAodWNoYXIgKilibXAgKyBn
ZXRfdW5hbGlnbmVkX2xlMzIoJmJtcC0+aGVhZGVyLmRhdGFfb2Zmc2V0KTsKIAorCS8qIGNoZWNr
IGlmIHBpY3R1cmUgc2l6ZSBleGNlZWQgcGFuZWwgc2l6ZSAqLworCWlmIChwcml2LT54c2l6ZSA8
IHdpZHRoKQorCQl3aWR0aCA9IHByaXYtPnhzaXplOworCisJaWYgKHByaXYtPnlzaXplIDwgaGVp
Z2h0KQorCQloZWlnaHQgPSBwcml2LT55c2l6ZTsKKwogCXggPSAwOwogCXkgPSBoZWlnaHQgLSAx
OwogCkBAIC0yNDksNiArMjU2LDEzIEBAIGludCB2aWRlb19ibXBfZGlzcGxheShzdHJ1Y3QgdWRl
dmljZSAqZGV2LCB1bG9uZyBibXBfaW1hZ2UsIGludCB4LCBpbnQgeSwKIAogCXBhZGRlZF93aWR0
aCA9ICh3aWR0aCAmIDB4MyA/ICh3aWR0aCAmIH4weDMpICsgNCA6IHdpZHRoKTsKIAorCS8qIGNo
ZWNrIGlmIHBpY3R1cmUgc2l6ZSBleGNlZWQgcGFuZWwgc2l6ZSAqLworCWlmIChwd2lkdGggPCB3
aWR0aCkKKwkJd2lkdGggPSBwd2lkdGg7CisKKwlpZiAocHJpdi0+eXNpemUgPCBoZWlnaHQpCisJ
CWhlaWdodCA9IHByaXYtPnlzaXplOworCiAJaWYgKGFsaWduKSB7CiAJCXZpZGVvX3NwbGFzaF9h
bGlnbl9heGlzKCZ4LCBwcml2LT54c2l6ZSwgd2lkdGgpOwogCQl2aWRlb19zcGxhc2hfYWxpZ25f
YXhpcygmeSwgcHJpdi0+eXNpemUsIGhlaWdodCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0
ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
