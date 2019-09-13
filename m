Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8EBB1B37
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC21DC32EA2
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA0E4C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:49:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9k496018532; Fri, 13 Sep 2019 11:48:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=DrtiC4OrhOqMySHhFT/t87yAd80IoAvB9BtRs+1hzj0=;
 b=hpwVCLphHatroRwWXmQrsczYy37zY41imo4GAG6uFtOQZ9K5zLwWaDM0ELOveZsDlqVS
 DgGrtL0kXWlfFTk25e+Zsif9hGHvUC4DeiFvImrdiEfZWXZJ3srNoY6VYokeGcPMt9sr
 Wlr59dEHQeR5XN+YjUjRq9jGnVVgBxMvgbQEqz4MVYZ9GMBKU3/LEF3sRI0OjOy3etiz
 J1VYwHyGZBVSik1UHoEs6WxebfNrJxcGKW6wyybFvnkd3f/oGYstQ2UWgoRa/khm3eBM
 NqbnzzgnpYIGJxW0RLecqKHHE8xD970Dah2IzZddP45amB6Wz+rN1j8xUxBihwrLC9hY aw== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uytdx46cf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7439359;
 Fri, 13 Sep 2019 09:48:52 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F3BC2BB897;
 Fri, 13 Sep 2019 11:48:52 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:52 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:51
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
Date: Fri, 13 Sep 2019 11:48:03 +0200
Message-ID: <1568368083-11075-16-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 15/15] stm32mp1: configs: add display
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
Y19kZWZjb25maWcKaW5kZXggMDk3ODViNS4uNmQxZTIwOCAxMDA2NDQKLS0tIGEvY29uZmlncy9z
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
