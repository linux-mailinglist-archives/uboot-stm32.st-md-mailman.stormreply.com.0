Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B2CE39E
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 15:29:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41D95C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 13:29:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B299BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:29:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DLB9n028580; Mon, 7 Oct 2019 15:29:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=eR9sK+ItRfhJzOqk4MBa5kBLWW9cHZogj8VOiXEveXc=;
 b=ioR+97y9vo4XcSPy5mokV9sFNCoMkNUZ3Lf1ojt0o68LZcoVaEipYd6X2zRea70yBaTt
 DVZgBIqO8oRVss8RkClrbEWTl26w4KtR4mfdSD245g/U0mfRZWrtpzMGdREWTwLtNg5R
 h4zbDCJ7iXJlYIcN+2d3vHNDaP2HfrdjwgLWZYihmDVZ1NBBOrjJW1S4ZiYZMgpwJU0d
 uxl/d6x68PXLcvVJwEcfZiT7NhdCBgsIBlEMIqSNZSgM1mx9VZsiusXyzA6cK5bx2huf
 ECWejgmX728506wL5c9Mqffq3jvHuboXLQlLe31gNyyIDzyggrehMIXsYlGuEov4keiQ TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegagtxpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:29:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 903C2100038;
 Mon,  7 Oct 2019 15:29:27 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 858D12BFDF5;
 Mon,  7 Oct 2019 15:29:27 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019
 15:29:27 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 15:29:26
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Mon, 7 Oct 2019 15:29:01 +0200
Message-ID: <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Subject: [Uboot-stm32] [PATCH v5 01/15] video: bmp: check resolutions of
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
CiBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYyBi
L2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMKaW5kZXggMTkzZjM3ZC4uNGFmMWZiNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYworKysgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVv
X2JtcC5jCkBAIC0yNDksNiArMjQ5LDEzIEBAIGludCB2aWRlb19ibXBfZGlzcGxheShzdHJ1Y3Qg
dWRldmljZSAqZGV2LCB1bG9uZyBibXBfaW1hZ2UsIGludCB4LCBpbnQgeSwKIAogCXBhZGRlZF93
aWR0aCA9ICh3aWR0aCAmIDB4MyA/ICh3aWR0aCAmIH4weDMpICsgNCA6IHdpZHRoKTsKIAorCS8q
IGNoZWNrIGlmIHBpY3R1cmUgc2l6ZSBleGNlZWRzIHBhbmVsIHNpemUgKi8KKwlpZiAoKHB3aWR0
aCA8IHdpZHRoKSB8fCAocHJpdi0+eXNpemUgPCBoZWlnaHQpKSB7CisJCXByaW50ZigiRXJyb3I6
IEJNUCBzaXplICVkIHggJWQgaXMgYmlnZ2VyIHRoYW4gcGFuZWwgc2l6ZSAlZCB4ICVkXG4iLAor
CQkgICAgICAgKGludCl3aWR0aCwgKGludCloZWlnaHQsIHByaXYtPnhzaXplLCBwcml2LT55c2l6
ZSk7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwogCWlmIChhbGlnbikgewogCQl2aWRlb19zcGxh
c2hfYWxpZ25fYXhpcygmeCwgcHJpdi0+eHNpemUsIHdpZHRoKTsKIAkJdmlkZW9fc3BsYXNoX2Fs
aWduX2F4aXMoJnksIHByaXYtPnlzaXplLCBoZWlnaHQpOwotLSAKMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
