Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D58B1B32
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 844DDC35E16
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C3E4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9jnXB018750; Fri, 13 Sep 2019 11:48:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=pC8m0Lo/vJNMVLTDlwz8SYHNaOC4RytITg3P4ewvK0g=;
 b=VonhwSXBBKrT2RF2c0VatatZy7dJle45l5NZMXyP+AIvMAbAtlPq5EY6vybKILIpOJwz
 VwhlJrbkui8qrc2fBU90WKGSRwtGyNyIfaa7tK/jHYoIDpWdC1NAxSA9I+3iUM9o/3vN
 p6iUpjZ3gfENf2R2exVnJ8DeVc6rst8rrwxKCXOLSHr5NX0BNSoL7RqvFeS7ARm60YtT
 cR6aywEkmP5KnB/tGaITuzqsP6QiRiFxt8GQ3B5Xncz4+z9vb3uN0G06CudKccEmCL8p
 7aTga8oTWWBmWHS8PNkVq8Zn+H9ip/4zgEGGl1UWAMnXTT3ctrX7jmnE1gZAeeEONRxj jg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uyte3v53y-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CD8CB51;
 Fri, 13 Sep 2019 09:48:44 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 35F322BB899;
 Fri, 13 Sep 2019 11:48:44 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:44 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:43
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
Date: Fri, 13 Sep 2019 11:47:58 +0200
Message-ID: <1568368083-11075-11-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 10/15] board: Add STM32F769 SoC,
	discovery board support
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

U2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0t
LQogY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnIHwgNjMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZwoK
ZGlmZiAtLWdpdCBhL2NvbmZpZ3Mvc3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
c3RtMzJmNzY5LWRpc2NvX2RlZmNvbmZpZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwLi44ODdlMmQ1Ci0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9zdG0zMmY3NjktZGlzY29f
ZGVmY29uZmlnCkBAIC0wLDAgKzEsNjMgQEAKK0NPTkZJR19BUk09eQorQ09ORklHX1NUTTMyPXkK
K0NPTkZJR19TWVNfVEVYVF9CQVNFPTB4MDgwMDgwMDAKK0NPTkZJR19TWVNfTUFMTE9DX0ZfTEVO
PTB4RTAwCitDT05GSUdfTlJfRFJBTV9CQU5LUz0xCitDT05GSUdfU1RNMzJGNz15CitDT05GSUdf
VEFSR0VUX1NUTTMyRjc0Nl9ESVNDTz15CitDT05GSUdfRElTVFJPX0RFRkFVTFRTPXkKK0NPTkZJ
R19CT09UREVMQVk9MworQ09ORklHX1VTRV9CT09UQVJHUz15CitDT05GSUdfQk9PVEFSR1M9ImNv
bnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5cHJpbnRrIGNvbnNvbGVibGFuaz0wIGlnbm9yZV9sb2ds
ZXZlbCIKKyMgQ09ORklHX1VTRV9CT09UQ09NTUFORCBpcyBub3Qgc2V0CisjIENPTkZJR19ESVNQ
TEFZX0NQVUlORk8gaXMgbm90IHNldAorIyBDT05GSUdfRElTUExBWV9CT0FSRElORk8gaXMgbm90
IHNldAorQ09ORklHX0JPQVJEX0VBUkxZX0lOSVRfRj15CitDT05GSUdfU1BMX1RFWFRfQkFTRT0w
eDgwMDAwMDAKK0NPTkZJR19TWVNfUFJPTVBUPSJVLUJvb3QgPiAiCitDT05GSUdfQVVUT0JPT1Rf
S0VZRUQ9eQorQ09ORklHX0FVVE9CT09UX1BST01QVD0iSGl0IFNQQUNFIGluICVkIHNlY29uZHMg
dG8gc3RvcCBhdXRvYm9vdC5cbiIKK0NPTkZJR19BVVRPQk9PVF9TVE9QX1NUUj0iICIKK0NPTkZJ
R19DTURfR1BUPXkKKyMgQ09ORklHX1JBTkRPTV9VVUlEIGlzIG5vdCBzZXQKK0NPTkZJR19DTURf
TU1DPXkKK0NPTkZJR19DTURfU0Y9eQorIyBDT05GSUdfQ01EX1NFVEVYUFIgaXMgbm90IHNldAor
Q09ORklHX0NNRF9TTlRQPXkKK0NPTkZJR19DTURfRE5TPXkKK0NPTkZJR19DTURfTElOS19MT0NB
TD15CitDT05GSUdfQ01EX0JNUD15CitDT05GSUdfQ01EX0NBQ0hFPXkKK0NPTkZJR19DTURfVElN
RVI9eQorIyBDT05GSUdfU1BMX0RPU19QQVJUSVRJT04gaXMgbm90IHNldAorIyBDT05GSUdfSVNP
X1BBUlRJVElPTiBpcyBub3Qgc2V0CisjIENPTkZJR19TUExfRUZJX1BBUlRJVElPTiBpcyBub3Qg
c2V0CitDT05GSUdfT0ZfQ09OVFJPTD15CitDT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRT0ic3Rt
MzJmNzY5LWRpc2NvIgorQ09ORklHX05FVF9SQU5ET01fRVRIQUREUj15CitDT05GSUdfTkVUQ09O
U09MRT15CitDT05GSUdfRE1fTU1DPXkKKyMgQ09ORklHX1NQTF9ETV9NTUMgaXMgbm90IHNldAor
Q09ORklHX0FSTV9QTDE4MF9NTUNJPXkKK0NPTkZJR19NVEQ9eQorQ09ORklHX01URF9OT1JfRkxB
U0g9eQorQ09ORklHX0RNX1NQSV9GTEFTSD15CitDT05GSUdfU1BJX0ZMQVNIPXkKK0NPTkZJR19T
UElfRkxBU0hfTUFDUk9OSVg9eQorQ09ORklHX1NQSV9GTEFTSF9TVE1JQ1JPPXkKK0NPTkZJR19E
TV9FVEg9eQorQ09ORklHX0VUSF9ERVNJR05XQVJFPXkKK0NPTkZJR19NSUk9eQorIyBDT05GSUdf
UElOQ1RSTF9GVUxMIGlzIG5vdCBzZXQKK0NPTkZJR19TUEk9eQorQ09ORklHX0RNX1NQST15CitD
T05GSUdfU1RNMzJfUVNQST15CitDT05GSUdfRE1fVklERU89eQorQ09ORklHX0JBQ0tMSUdIVF9H
UElPPXkKK0NPTkZJR19WSURFT19MQ0RfT1JJU0VURUNIX09UTTgwMDlBPXkKK0NPTkZJR19WSURF
T19TVE0zMj15CitDT05GSUdfVklERU9fU1RNMzJfRFNJPXkKK0NPTkZJR19WSURFT19TVE0zMl9N
QVhfWFJFUz00ODAKK0NPTkZJR19WSURFT19TVE0zMl9NQVhfWVJFUz04MDAKK0NPTkZJR19PRl9M
SUJGRFRfT1ZFUkxBWT15CisjIENPTkZJR19FRklfTE9BREVSIGlzIG5vdCBzZXQKLS0gCjIuNy40
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
