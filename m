Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0087FE4701
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 11:22:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB26AC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 09:22:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEA59C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 09:22:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9P967k1017621; Fri, 25 Oct 2019 11:21:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=2pcyFAPGqLEcDsTTvkljqGBXfa5qIeoO2oLUpDXgJ94=;
 b=stShMBxYDBdHIfqYCqdPombWDAj0wmBj4zJZ+Ubyv0Eluw+mpzNTGLcRKUoNOC0lGpDo
 fxJyODRMdC96PiR6tj4KE00QckJsfSDJADJBIOrSfctgg/13kVZGz0Oaa+BCGE0stKzt
 GtVRUJGkCK2GJ7yT+j37w8qGIt3fo5Z1J1SsUKNCF05NdEVEWgDrVI7yAXv8pdi4oP1y
 4CzSWjp1DQvDpgND+ode52rWS64NsDM763v7nkda/jCvqu8wP9ajfIm37ONFe2Ny72bD
 2zrukhz5zzjlS4HP5zFuh/I7bYNWdg4iN/r1VJF0OL5NdIstg4wVgg2E7Cx38dduEGUe Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vt9s1xtmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Oct 2019 11:21:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C486910002A;
 Fri, 25 Oct 2019 11:21:58 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B28402BEC4D;
 Fri, 25 Oct 2019 11:21:58 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 25 Oct
 2019 11:21:58 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 25 Oct 2019 11:21:57
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>, Yannick
 Fertre <yannick.fertre@st.com>, "Philippe Cornu" <philippe.cornu@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Eugen Hristev
 <eugen.hristev@microchip.com>, Simon Goldschmidt
 <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Fri, 25 Oct 2019 11:21:49 +0200
Message-ID: <1571995309-8069-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_05:2019-10-23,2019-10-25 signatures=0
Subject: [Uboot-stm32] [PATCH] video: bmp: check coordinates of bitmap
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

SWYgdGhlIGNvb3JkaW5hdGVzIGFyZSBiaWdnZXIgdGhhbiB0aGUgc2l6ZSBvZgp0aGUgcGFuZWwg
dGhlbiBlcnJvcnMgYXBwZWFyIHdoZW4gY2FsY3VsYXRpbmcgYXhpcyBhbGlnbm1lbnQKYW5kIHRo
ZSBjb3B5IG9mIGJpdG1hcCBpcyBkb25lIG91dHNpZGUgb2YgZnJhbWVidWZmZXIuCgpTaWduZWQt
b2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBkcml2
ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIHwgMTMgKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5j
IGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYwppbmRleCA0YWYxZmI0Li43NDI2N2Y3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vdmlk
ZW9fYm1wLmMKQEAgLTI1Niw2ICsyNTYsMTkgQEAgaW50IHZpZGVvX2JtcF9kaXNwbGF5KHN0cnVj
dCB1ZGV2aWNlICpkZXYsIHVsb25nIGJtcF9pbWFnZSwgaW50IHgsIGludCB5LAogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKKwkvKiBjaGVjayBpZiBjb29yZGluYXRlcyBleGNlZWRzIHBhbmVsIHNp
emUgKi8KKwlpZiAocHdpZHRoIDwgeCAmJiB4ICE9IEJNUF9BTElHTl9DRU5URVIpIHsKKwkJcHJp
bnRmKCJFcnJvcjogQ29vcmRpbmF0ZSB4ICVkIGlzIGJpZ2dlciB0aGFuIHBhbmVsIHdpZHRoICVk
XG4iLAorCQkgICAgICAgKGludCl4LCAoaW50KXB3aWR0aCk7CisJCXJldHVybiAtRUlOVkFMOwor
CX0KKworCWlmIChwcml2LT55c2l6ZSA8IHkgJiYgeSAhPSBCTVBfQUxJR05fQ0VOVEVSKSB7CisJ
CXByaW50ZigiRXJyb3I6IENvb3JkaW5hdGUgeSAlZCBpcyBiaWdnZXIgdGhhbiBwYW5lbCBoZWln
aHQgJWRcbiIKKwkJICAgICAgICwgKGludCl5LCAoaW50KXByaXYtPnlzaXplKTsKKwkJcmV0dXJu
IC1FSU5WQUw7CisJfQorCiAJaWYgKGFsaWduKSB7CiAJCXZpZGVvX3NwbGFzaF9hbGlnbl9heGlz
KCZ4LCBwcml2LT54c2l6ZSwgd2lkdGgpOwogCQl2aWRlb19zcGxhc2hfYWxpZ25fYXhpcygmeSwg
cHJpdi0+eXNpemUsIGhlaWdodCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
