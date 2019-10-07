Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84CCE3B8
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 15:29:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8900C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 13:29:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59859C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:29:54 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DLa7R031389; Mon, 7 Oct 2019 15:29:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=lBdxFT7fNbbBpv/jgS3oVpY5q6XkNjxQsS57cuJSTL4=;
 b=yGiQVZgtpxf2gJIQ9mAt8WDP/N49CQFy9suaQeEx2m2cLSn9q+GQU9iAmQGHbpWLtxlc
 Y0OwRZsWxLMo4QxW6EyCCC5X5j+6ccuZC0qSORlZ+hv/t3iSM8SzMuXzQKTg05Bug44N
 WD9qrbuexCiNxqgm0oeczyODLQQTvQLWQBh7jBcVaMoX5ClFxbGgGgmVQgmwIsD2Ms+L
 vk2Sf1wKZWMNl/TrAmn9b/sE/yyOXZd25Y/UPT04wHSzF61GgjuXMFocZkfAs6tFqQY1
 oJapWZEbxw1NnoywkBck4u+NN/NbDfayVj8WYheAu1SyMgikTXIkXl/vGBxeL+6hgK3m iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegxvjh9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:29:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47C1A100039;
 Mon,  7 Oct 2019 15:29:49 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C9C62C38C4;
 Mon,  7 Oct 2019 15:29:49 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019
 15:29:49 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 15:29:47
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
Date: Mon, 7 Oct 2019 15:29:15 +0200
Message-ID: <1570454955-21298-16-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Subject: [Uboot-stm32] [PATCH v5 15/15] stm32mp1: configs: add display
	devices
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

QWRkIHN1cHBvcnQgb2YgcGFuZWxzIG90bTgwMDlBLCBSTTY4MjAwICYgRFNJIGNvbnRyb2xsZXIu
CkxpbWl0IHJlc29sdXRpb24gdG8gMTI4MHg4MDAuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZl
cnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KLS0tCiBjb25maWdzL3N0bTMybXAxNV9iYXNp
Y19kZWZjb25maWcgICB8IDYgKysrKysrCiBjb25maWdzL3N0bTMybXAxNV9vcHRlZV9kZWZjb25m
aWcgICB8IDYgKysrKysrCiBjb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyB8IDYg
KysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9j
b25maWdzL3N0bTMybXAxNV9iYXNpY19kZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAxNV9iYXNp
Y19kZWZjb25maWcKaW5kZXggZjZjNjhmZS4uYzU0ZmViMCAxMDA2NDQKLS0tIGEvY29uZmlncy9z
dG0zMm1wMTVfYmFzaWNfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2Rl
ZmNvbmZpZwpAQCAtMTI0LDQgKzEyNCwxMCBAQCBDT05GSUdfVVNCX0dBREdFVF9QUk9EVUNUX05V
TT0weDU3MjAKIENPTkZJR19VU0JfR0FER0VUX0RXQzJfT1RHPXkKIENPTkZJR19ETV9WSURFTz15
CiBDT05GSUdfQkFDS0xJR0hUX0dQSU89eQorQ09ORklHX1ZJREVPX0xDRF9PUklTRVRFQ0hfT1RN
ODAwOUE9eQorQ09ORklHX1ZJREVPX0xDRF9SQVlESVVNX1JNNjgyMDA9eQorQ09ORklHX1ZJREVP
X1NUTTMyPXkKK0NPTkZJR19WSURFT19TVE0zMl9EU0k9eQorQ09ORklHX1ZJREVPX1NUTTMyX01B
WF9YUkVTPTEyODAKK0NPTkZJR19WSURFT19TVE0zMl9NQVhfWVJFUz04MDAKIENPTkZJR19GRFRf
RklYVVBfUEFSVElUSU9OUz15CmRpZmYgLS1naXQgYS9jb25maWdzL3N0bTMybXAxNV9vcHRlZV9k
ZWZjb25maWcgYi9jb25maWdzL3N0bTMybXAxNV9vcHRlZV9kZWZjb25maWcKaW5kZXggMTc3Y2Jj
Ny4uNDkxMTc0ZiAxMDA2NDQKLS0tIGEvY29uZmlncy9zdG0zMm1wMTVfb3B0ZWVfZGVmY29uZmln
CisrKyBiL2NvbmZpZ3Mvc3RtMzJtcDE1X29wdGVlX2RlZmNvbmZpZwpAQCAtMTA5LDQgKzEwOSwx
MCBAQCBDT05GSUdfVVNCX0dBREdFVF9QUk9EVUNUX05VTT0weDU3MjAKIENPTkZJR19VU0JfR0FE
R0VUX0RXQzJfT1RHPXkKIENPTkZJR19ETV9WSURFTz15CiBDT05GSUdfQkFDS0xJR0hUX0dQSU89
eQorQ09ORklHX1ZJREVPX0xDRF9PUklTRVRFQ0hfT1RNODAwOUE9eQorQ09ORklHX1ZJREVPX0xD
RF9SQVlESVVNX1JNNjgyMDA9eQorQ09ORklHX1ZJREVPX1NUTTMyPXkKK0NPTkZJR19WSURFT19T
VE0zMl9EU0k9eQorQ09ORklHX1ZJREVPX1NUTTMyX01BWF9YUkVTPTEyODAKK0NPTkZJR19WSURF
T19TVE0zMl9NQVhfWVJFUz04MDAKIENPTkZJR19GRFRfRklYVVBfUEFSVElUSU9OUz15CmRpZmYg
LS1naXQgYS9jb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyBiL2NvbmZpZ3Mvc3Rt
MzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCmluZGV4IDcxYWQxMTUuLmE4YTdlZWMgMTAwNjQ0Ci0t
LSBhL2NvbmZpZ3Mvc3RtMzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3Mvc3Rt
MzJtcDE1X3RydXN0ZWRfZGVmY29uZmlnCkBAIC0xMDgsNCArMTA4LDEwIEBAIENPTkZJR19VU0Jf
R0FER0VUX1BST0RVQ1RfTlVNPTB4NTcyMAogQ09ORklHX1VTQl9HQURHRVRfRFdDMl9PVEc9eQog
Q09ORklHX0RNX1ZJREVPPXkKIENPTkZJR19CQUNLTElHSFRfR1BJTz15CitDT05GSUdfVklERU9f
TENEX09SSVNFVEVDSF9PVE04MDA5QT15CitDT05GSUdfVklERU9fTENEX1JBWURJVU1fUk02ODIw
MD15CitDT05GSUdfVklERU9fU1RNMzI9eQorQ09ORklHX1ZJREVPX1NUTTMyX0RTST15CitDT05G
SUdfVklERU9fU1RNMzJfTUFYX1hSRVM9MTI4MAorQ09ORklHX1ZJREVPX1NUTTMyX01BWF9ZUkVT
PTgwMAogQ09ORklHX0ZEVF9GSVhVUF9QQVJUSVRJT05TPXkKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5n
IGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
