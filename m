Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433BB1B29
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E87DC35E02
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C55DC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9jnSN018758; Fri, 13 Sep 2019 11:48:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=nFaC8CGwMUvAN2YokuPc6N+gMealSoe3Uh3aFf3snZo=;
 b=XXl+46iSZEPtdq1iRXjVbgyChoGE1BItkJQRv8Sv8AbU1nv/1dhJFrr2aYAYbMdghYLl
 w4AmMQqRDs0J4qMttYTT9fzYNoP6dRnVYZwR6T+pzn3MfgovRiFOGtT9+rBiaY0Y1enI
 Ohui8M5hv9bje65BhLD1s1zUwkyRHWSefvnfsK25AqingbVJVu9PGDfjhTm3itMx34of
 mwu6OegHJbHD6nCsZMHLiPO4cWPxT+tY7H6WJuLXF7V5LqVKLb2KTEVgrzD0x0Ak2jCa
 /sh23bQytBt4f97u2Ma94t0uGAk3q0laUmZJ/PNufS2MGzBqTkXUN8EVtUIxMsck+yO6 zQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uyte3v52m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 372604D;
 Fri, 13 Sep 2019 09:48:31 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4FEC2B8EC7;
 Fri, 13 Sep 2019 11:48:30 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:30 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:29
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
Date: Fri, 13 Sep 2019 11:47:51 +0200
Message-ID: <1568368083-11075-4-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 03/15] include: Add new DCS commands in the
	enum list
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

QWRkaW5nIG5ldyBEQ1MgY29tbWFuZHMgd2hpY2ggYXJlIHNwZWNpZmllZCBpbiB0aGUKRENTIDEu
MyBzcGVjIHJlbGF0ZWQgdG8gQ0FCQy4KClNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8
eWFubmljay5mZXJ0cmVAc3QuY29tPgotLS0KIGluY2x1ZGUvbWlwaV9kaXNwbGF5LmggfCA4ICsr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9taXBpX2Rpc3BsYXkuaCBiL2luY2x1ZGUvbWlwaV9kaXNwbGF5LmgKaW5kZXggZGRjYzhj
YS4uMTlhYTY1YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9taXBpX2Rpc3BsYXkuaAorKysgYi9pbmNs
dWRlL21pcGlfZGlzcGxheS5oCkBAIC0xMTUsNiArMTE1LDE0IEBAIGVudW0gewogCU1JUElfRENT
X1JFQURfTUVNT1JZX0NPTlRJTlVFCT0gMHgzRSwKIAlNSVBJX0RDU19TRVRfVEVBUl9TQ0FOTElO
RQk9IDB4NDQsCiAJTUlQSV9EQ1NfR0VUX1NDQU5MSU5FCQk9IDB4NDUsCisJTUlQSV9EQ1NfU0VU
X0RJU1BMQVlfQlJJR0hUTkVTUyA9IDB4NTEsCQkvKiBNSVBJIERDUyAxLjMgKi8KKwlNSVBJX0RD
U19HRVRfRElTUExBWV9CUklHSFRORVNTID0gMHg1MiwJCS8qIE1JUEkgRENTIDEuMyAqLworCU1J
UElfRENTX1dSSVRFX0NPTlRST0xfRElTUExBWSAgPSAweDUzLAkJLyogTUlQSSBEQ1MgMS4zICov
CisJTUlQSV9EQ1NfR0VUX0NPTlRST0xfRElTUExBWQk9IDB4NTQsCQkvKiBNSVBJIERDUyAxLjMg
Ki8KKwlNSVBJX0RDU19XUklURV9QT1dFUl9TQVZFCT0gMHg1NSwJCS8qIE1JUEkgRENTIDEuMyAq
LworCU1JUElfRENTX0dFVF9QT1dFUl9TQVZFCQk9IDB4NTYsCQkvKiBNSVBJIERDUyAxLjMgKi8K
KwlNSVBJX0RDU19TRVRfQ0FCQ19NSU5fQlJJR0hUTkVTUyA9IDB4NUUsCS8qIE1JUEkgRENTIDEu
MyAqLworCU1JUElfRENTX0dFVF9DQUJDX01JTl9CUklHSFRORVNTID0gMHg1RiwJLyogTUlQSSBE
Q1MgMS4zICovCiAJTUlQSV9EQ1NfUkVBRF9EREJfU1RBUlQJCT0gMHhBMSwKIAlNSVBJX0RDU19S
RUFEX0REQl9DT05USU5VRQk9IDB4QTgsCiB9OwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
