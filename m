Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA87B1B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 11:53:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A92DC35E18
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 09:53:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C2A6C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 09:48:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8D9jkcb018702; Fri, 13 Sep 2019 11:48:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=gA1aY/jgi1FDZM6Wnld+XjiRYJmKCacWDKOeTVLTq7Y=;
 b=snvPlr8xMvVXtxJdcoXInEOtIcx6VvvL83bdTjSKy0H6cWVuPAQKq+VCWuxqXADkxBs8
 4TMuJsfwvs+fZXccBxiBf2PxInf7lFVf81SL6AUi+GJz5CP1qJ+TucnuDNdgUnLXkk+V
 gXvbE93uOKjzEUHXNzbtaeMtqJBzi+KrZiNDfRD1CYIEOcUjKzvnzAUu6MXP1Zfl2Z6e
 mV4tcjP+2Yg0s83fBQ6tPIIpaU/5a+L+qd0ro8DHwGesZA+bb7z2trF3hHMJBLlbuMuT
 asX/Y0VSmFehkxZ9d45oEKnpS9pHIVikxUyuSm5qrbU//FjQKFYVHzUAMX+5ymcjAu14 iA== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uyte3v54p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 13 Sep 2019 11:48:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF1874C;
 Fri, 13 Sep 2019 09:48:46 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20B292BB898;
 Fri, 13 Sep 2019 11:48:46 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep
 2019 11:48:45 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 13 Sep 2019 11:48:45
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
Date: Fri, 13 Sep 2019 11:47:59 +0200
Message-ID: <1568368083-11075-12-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-13_05:2019-09-11,2019-09-13 signatures=0
X-Mailman-Approved-At: Fri, 13 Sep 2019 09:53:41 +0000
Subject: [Uboot-stm32] [PATCH v4 11/15] ARM: dts: stm32f769: add display for
	STM32F769 disco board
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

RW5hYmxlIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIsIG1pcGkgZHNpIGJyaWRnZSAmIHBhbmVsLgpT
ZXQgcGFuZWwgZGlzcGxheSB0aW1pbmdzLgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOp
IDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Ci0tLQogYXJjaC9hcm0vZHRzL3N0bTMyZjc2OS1kaXNj
by11LWJvb3QuZHRzaSB8IDYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9z
dG0zMmY3NjktZGlzY28tdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJmNzY5LWRpc2Nv
LXUtYm9vdC5kdHNpCmluZGV4IDIwOWE4MmMuLmMxZDdkNmIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJt
L2R0cy9zdG0zMmY3NjktZGlzY28tdS1ib290LmR0c2kKKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMy
Zjc2OS1kaXNjby11LWJvb3QuZHRzaQpAQCAtMjgsMTAgKzI4LDcyIEBACiAJCWJ1dHRvbi1ncGlv
ID0gPCZncGlvYSAwIDA+OwogCX07CiAKKwlkc2lfaG9zdDogZHNpX2hvc3QgeworCQljb21wYXRp
YmxlID0gInN5bm9wc3lzLGR3LW1pcGktZHNpIjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07CisK
IAlsZWQxIHsKIAkJY29tcGF0aWJsZSA9ICJzdCxsZWQxIjsKIAkJbGVkLWdwaW8gPSA8JmdwaW9q
IDUgMD47CiAJfTsKKworCXBhbmVsOiBwYW5lbCB7CisJCWNvbXBhdGlibGUgPSAib3Jpc2V0ZWNo
LG90bTgwMDlhIjsKKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwaW9qIDE1IDE+OworCQlzdGF0dXMgPSAi
b2theSI7CisKKwkJcG9ydCB7CisJCQlwYW5lbF9pbjogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmZHNpX291dD47CisJCQl9OworCQl9OworCX07CisKKwlzb2MgeworCQlkc2k6
IGRzaUA0MDAxNmMwMCB7CisJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWRzaSI7CisJCQlyZWcg
PSA8MHg0MDAxNkMwMCAweDgwMD47CisJCQlyZXNldHMgPSA8JnJjYyBTVE0zMkY3X0FQQjJfUkVT
RVQoRFNJKT47CisJCQljbG9ja3MgPSAgPCZyY2MgMCBTVE0zMkY3X0FQQjJfQ0xPQ0soRFNJKT4s
CisJCQkJICA8JnJjYyAwIFNUTTMyRjdfQVBCMl9DTE9DSyhMVERDKT4sCisJCQkJICA8JmNsa19o
c2U+OworCQkJY2xvY2stbmFtZXMgPSAicGNsayIsICJweF9jbGsiLCAicmVmIjsKKwkJCXUtYm9v
dCxkbS1wcmUtcmVsb2M7CisJCQlzdGF0dXMgPSAib2theSI7CisKKwkJCXBvcnRzIHsKKwkJCQlw
b3J0QDAgeworCQkJCQlkc2lfb3V0OiBlbmRwb2ludCB7CisJCQkJCQlyZW1vdGUtZW5kcG9pbnQg
PSA8JnBhbmVsX2luPjsKKwkJCQkJfTsKKwkJCQl9OworCQkJCXBvcnRAMSB7CisJCQkJCWRzaV9p
bjogZW5kcG9pbnQgeworCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkcF9vdXQ+OworCQkJCQl9
OworCQkJCX07CisJCQl9OworCQl9OworCisJCWx0ZGM6IGRpc3BsYXktY29udHJvbGxlckA0MDAx
NjgwMCB7CisJCQljb21wYXRpYmxlID0gInN0LHN0bTMyLWx0ZGMiOworCQkJcmVnID0gPDB4NDAw
MTY4MDAgMHgyMDA+OworCQkJcmVzZXRzID0gPCZyY2MgU1RNMzJGN19BUEIyX1JFU0VUKExUREMp
PjsKKwkJCWNsb2NrcyA9IDwmcmNjIDAgU1RNMzJGN19BUEIyX0NMT0NLKExUREMpPjsKKworCQkJ
c3RhdHVzID0gIm9rYXkiOworCQkJdS1ib290LGRtLXByZS1yZWxvYzsKKworCQkJcG9ydHMgewor
CQkJCXBvcnRAMCB7CisJCQkJCWRwX291dDogZW5kcG9pbnQgeworCQkJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZkc2lfaW4+OworCQkJCQl9OworCQkJCX07CisJCQl9OworCQl9OworCX07CiB9Owog
CiAmZm1jIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
