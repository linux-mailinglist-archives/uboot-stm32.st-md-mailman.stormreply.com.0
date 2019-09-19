Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E045B7EA7
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Sep 2019 17:57:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57490C35E02
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Sep 2019 15:57:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7A5CC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2019 15:50:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JFaG37020241; Thu, 19 Sep 2019 17:50:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=nC2dpel8NkqpVnVPGLwzVksJo9ezN2hKi37p9lJGyTc=;
 b=0T7Cvsczvxi46ToKXCjUuAuOt7xGab/5npFLPVOE9fq4gaGOz9ISCAm/1JCgn2npZRwg
 WpSxct0D84y5Ec72K7LLptSDFkb924Q6CP2fCNqjpKcpEmfhn9vhftcmyrCrAZdbMFNC
 3+/APUTHzYtnNw7LCKt6cgW8i0xrC2zZe76DU7AS+Yw8/pIGKZm0KsxbKWz55bCngD9U
 NpGymha9QiuXiOemx+udy1iR4ByL5kqcq9t795FZZY+yj5pUp2wZ3l7AFiLDYturWqc2
 /hMdgAArnEbFPYfmBBXgXo80nRuLApqCzJJytjIttxP/L3PVna0tmsw4bfacX5rExRb9 mQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v3va2d8y7-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 19 Sep 2019 17:50:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49B894B;
 Thu, 19 Sep 2019 15:50:09 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1DAB2BDA95;
 Thu, 19 Sep 2019 17:50:08 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 19 Sep
 2019 17:50:08 +0200
Received: from localhost (10.48.1.208) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 19 Sep 2019 17:50:08 +0200
From: Yann Gautier <yann.gautier@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 19 Sep 2019 17:50:04 +0200
Message-ID: <20190919155005.1848-1-yann.gautier@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.48.1.208]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_05:2019-09-19,2019-09-19 signatures=0
X-Mailman-Approved-At: Thu, 19 Sep 2019 15:57:32 +0000
Cc: Peng Fan <peng.fan@nxp.com>, Anup Patel <Anup.Patel@wdc.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Sam Protsenko <semen.protsenko@linaro.org>, Jens
 Wiklander <jens.wiklander@linaro.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/2] mmc: add a driver callback for power-cycle
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

U29tZSBNTUMgcGVyaXBoZXJhbHMgcmVxdWlyZSBzcGVjaWZpYyBwb3dlciBjeWNsZSBzZXF1ZW5j
ZSwgd2hlcmUgc29tZQpyZWdpc3RlcnMgbmVlZCB0byBiZSB3cml0dGVuIGJldHdlZW4gdGhlIHJl
Z3VsYXRvciBpcyB0dXJuZWQgb2ZmIGFuZCB0aGVuCmJhY2sgb24uIFRoaXMgaXMgdGhlIGNhc2Ug
Zm9yIHRoZSBNTUMgSVAgZW1iZWRkZWQgaW4gU1RNMzJNUDEgU29DLgoKSW4gU1RNMzJNUDE1NyBy
ZWZlcmVuY2UgbWFudWFsIFsxXSwgdGhlIHBvd2VyIGN5Y2xlIHNlcXVlbmNlIGlzOgoxLiBSZXNl
dCB0aGUgU0RNTUMgd2l0aCB0aGUgUkNDLlNETU1DeFJTVCByZWdpc3RlciBiaXQuIFRoaXMgd2ls
bCByZXNldAp0aGUgU0RNTUMgdG8gdGhlIHJlc2V0IHN0YXRlIGFuZCB0aGUgQ1BTTSBhbmQgRFBT
TSB0byB0aGUgSWRsZSBzdGF0ZS4KMi4gRGlzYWJsZSB0aGUgVmNjIHBvd2VyIHRvIHRoZSBjYXJk
LgozLiBTZXQgdGhlIFNETU1DIGluIHBvd2VyLWN5Y2xlIHN0YXRlLiBUaGlzIHdpbGwgbWFrZSB0
aGF0IHRoZQpTRE1NQ19EWzc6MF0sIFNETU1DX0NNRCBhbmQgU0RNTUNfQ0sgYXJlIGRyaXZlbiBs
b3csIHRvIHByZXZlbnQgdGhlIGNhcmQKZnJvbSBiZWluZyBzdXBwbGllZCB0aHJvdWdoIHRoZSBz
aWduYWwgbGluZXMuCjQuIEFmdGVyIG1pbmltdW0gMW1zIGVuYWJsZSB0aGUgVmNjIHBvd2VyIHRv
IHRoZSBjYXJkLgo1LiBBZnRlciB0aGUgcG93ZXIgcmFtcCBwZXJpb2Qgc2V0IHRoZSBTRE1NQyB0
byB0aGUgcG93ZXItb2ZmIHN0YXRlIGZvcgptaW5pbXVtIDFtcy4gVGhlIFNETU1DX0RbNzowXSwg
U0RNTUNfQ01EIGFuZCBTRE1NQ19DSyBhcmUgc2V0IHRvCmRyaXZlIOKAnDHigJ0uCjYuIEFmdGVy
IHRoZSAxbXMgZGVsYXkgc2V0IHRoZSBTRE1NQyB0byBwb3dlci1vbiBzdGF0ZSBpbiB3aGljaCB0
aGUKU0RNTUNfQ0sgY2xvY2sgd2lsbCBiZSBlbmFibGVkLgo3LiBBZnRlciA3NCBTRE1NQ19DSyBj
eWNsZXMgdGhlIGZpcnN0IGNvbW1hbmQgY2FuIGJlIHNlbnQgdG8gdGhlIGNhcmQuCgpUaGUgc3Rl
cCAzLiBjYW5ub3QgYmUgaGFuZGxlZCBieSB0aGUgY3VycmVudCBmcmFtZXdvcmsgaW1wbGVtZW50
YXRpb24uCkEgbmV3IGNhbGxiYWNrIChob3N0X3Bvd2VyX2N5Y2xlKSBpcyBjcmVhdGVkLCBhbmQg
Y2FsbGVkIGluCm1tY19wb3dlcl9jeWNsZSgpLCBhZnRlciBtbWNfcG93ZXJfb2ZmKCkuCgpUaGUg
aW5jb3JyZWN0IHBvd2VyIGN5Y2xlIHNlcXVlbmNlIGhhcyBzaG93biBzb21lIGJvb3QgZmFpbHVy
ZXMgb24KU1RNMzJNUDEgd2l0aCBzb21lIFNELWNhcmRzLCBlc3BlY2lhbGx5IG9uIGNvbGQgYm9v
dHMgd2hlbiB0aGUgaW5wdXQKZnJlcXVlbmN5IGlzIGxvdyAoPD0gMjVNSHopLgpUaG9zZSBmYWls
dXJlcyBhcmUgbm8gbW9yZSBzZWVuIHdpdGggdGhpcyBjb3JyZWN0IHBvd2VyIGN5Y2xlIHNlcXVl
bmNlLgoKWzFdIGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9yZWZlcmVuY2VfbWFudWFs
L0RNMDAzMjc2NTkucGRmCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGll
ckBzdC5jb20+Ci0tLQoKIGRyaXZlcnMvbW1jL21tYy11Y2xhc3MuYyB8IDE0ICsrKysrKysrKysr
KysrCiBkcml2ZXJzL21tYy9tbWMuYyAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKIGluY2x1
ZGUvbW1jLmggICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwg
NDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL21tYy11Y2xhc3MuYyBi
L2RyaXZlcnMvbW1jL21tYy11Y2xhc3MuYwppbmRleCAzN2MzODQzOTAyLi5jN2E4MzJjYTkwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL21tYy9tbWMtdWNsYXNzLmMKKysrIGIvZHJpdmVycy9tbWMvbW1j
LXVjbGFzcy5jCkBAIC0xMjIsNiArMTIyLDIwIEBAIGludCBtbWNfc2V0X2VuaGFuY2VkX3N0cm9i
ZShzdHJ1Y3QgbW1jICptbWMpCiB9CiAjZW5kaWYKIAoraW50IGRtX21tY19ob3N0X3Bvd2VyX2N5
Y2xlKHN0cnVjdCB1ZGV2aWNlICpkZXYpCit7CisJc3RydWN0IGRtX21tY19vcHMgKm9wcyA9IG1t
Y19nZXRfb3BzKGRldik7CisKKwlpZiAob3BzLT5ob3N0X3Bvd2VyX2N5Y2xlKQorCQlyZXR1cm4g
b3BzLT5ob3N0X3Bvd2VyX2N5Y2xlKGRldik7CisJcmV0dXJuIDA7Cit9CisKK2ludCBtbWNfaG9z
dF9wb3dlcl9jeWNsZShzdHJ1Y3QgbW1jICptbWMpCit7CisJcmV0dXJuIGRtX21tY19ob3N0X3Bv
d2VyX2N5Y2xlKG1tYy0+ZGV2KTsKK30KKwogaW50IG1tY19vZl9wYXJzZShzdHJ1Y3QgdWRldmlj
ZSAqZGV2LCBzdHJ1Y3QgbW1jX2NvbmZpZyAqY2ZnKQogewogCWludCB2YWw7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL21tYy9tbWMuYyBiL2RyaXZlcnMvbW1jL21tYy5jCmluZGV4IGM4ZjcxY2QwYzEu
LjJlNjhkMjFjNTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL21tYy5jCisrKyBiL2RyaXZlcnMv
bW1jL21tYy5jCkBAIC0xNTQ2LDYgKzE1NDYsMTYgQEAgc3RhdGljIGludCBtbWNfc2V0X2lvcyhz
dHJ1Y3QgbW1jICptbWMpCiAKIAlyZXR1cm4gcmV0OwogfQorCitzdGF0aWMgaW50IG1tY19ob3N0
X3Bvd2VyX2N5Y2xlKHN0cnVjdCBtbWMgKm1tYykKK3sKKwlpbnQgcmV0ID0gMDsKKworCWlmICht
bWMtPmNmZy0+b3BzLT5ob3N0X3Bvd2VyX2N5Y2xlKQorCQlyZXQgPSBtbWMtPmNmZy0+b3BzLT5o
b3N0X3Bvd2VyX2N5Y2xlKG1tYyk7CisKKwlyZXR1cm4gcmV0OworfQogI2VuZGlmCiAKIGludCBt
bWNfc2V0X2Nsb2NrKHN0cnVjdCBtbWMgKm1tYywgdWludCBjbG9jaywgYm9vbCBkaXNhYmxlKQpA
QCAtMjcxNSw2ICsyNzI1LDExIEBAIHN0YXRpYyBpbnQgbW1jX3Bvd2VyX2N5Y2xlKHN0cnVjdCBt
bWMgKm1tYykKIAlyZXQgPSBtbWNfcG93ZXJfb2ZmKG1tYyk7CiAJaWYgKHJldCkKIAkJcmV0dXJu
IHJldDsKKworCXJldCA9IG1tY19ob3N0X3Bvd2VyX2N5Y2xlKG1tYyk7CisJaWYgKHJldCkKKwkJ
cmV0dXJuIHJldDsKKwogCS8qCiAJICogU0Qgc3BlYyByZWNvbW1lbmRzIGF0IGxlYXN0IDFtcyBv
ZiBkZWxheS4gTGV0J3Mgd2FpdCBmb3IgMm1zCiAJICogdG8gYmUgb24gdGhlIHNhZmVyIHNpZGUu
CmRpZmYgLS1naXQgYS9pbmNsdWRlL21tYy5oIGIvaW5jbHVkZS9tbWMuaAppbmRleCA2ODZiYTAw
NjU2Li41NDYyOWJmNDVkIDEwMDY0NAotLS0gYS9pbmNsdWRlL21tYy5oCisrKyBiL2luY2x1ZGUv
bW1jLmgKQEAgLTQ2Niw2ICs0NjYsMTYgQEAgc3RydWN0IGRtX21tY19vcHMgewogCS8qIHNldF9l
bmhhbmNlZF9zdHJvYmUoKSAtIHNldCBIUzQwMCBlbmhhbmNlZCBzdHJvYmUgKi8KIAlpbnQgKCpz
ZXRfZW5oYW5jZWRfc3Ryb2JlKShzdHJ1Y3QgdWRldmljZSAqZGV2KTsKICNlbmRpZgorCisJLyoq
CisJICogaG9zdF9wb3dlcl9jeWNsZSAtIGhvc3Qgc3BlY2lmaWMgdGFza3MgaW4gcG93ZXIgY3lj
bGUgc2VxdWVuY2UKKwkgKgkJICAgICAgQ2FsbGVkIGJldHdlZW4gbW1jX3Bvd2VyX29mZigpIGFu
ZAorCSAqCQkgICAgICBtbWNfcG93ZXJfb24oKQorCSAqCisJICogQGRldjoJRGV2aWNlIHRvIGNo
ZWNrCisJICogQHJldHVybiAwIGlmIG5vdCBwcmVzZW50LCAxIGlmIHByZXNlbnQsIC12ZSBvbiBl
cnJvcgorCSAqLworCWludCAoKmhvc3RfcG93ZXJfY3ljbGUpKHN0cnVjdCB1ZGV2aWNlICpkZXYp
OwogfTsKIAogI2RlZmluZSBtbWNfZ2V0X29wcyhkZXYpICAgICAgICAoKHN0cnVjdCBkbV9tbWNf
b3BzICopKGRldiktPmRyaXZlci0+b3BzKQpAQCAtNDc3LDYgKzQ4Nyw3IEBAIGludCBkbV9tbWNf
Z2V0X2NkKHN0cnVjdCB1ZGV2aWNlICpkZXYpOwogaW50IGRtX21tY19nZXRfd3Aoc3RydWN0IHVk
ZXZpY2UgKmRldik7CiBpbnQgZG1fbW1jX2V4ZWN1dGVfdHVuaW5nKHN0cnVjdCB1ZGV2aWNlICpk
ZXYsIHVpbnQgb3Bjb2RlKTsKIGludCBkbV9tbWNfd2FpdF9kYXQwKHN0cnVjdCB1ZGV2aWNlICpk
ZXYsIGludCBzdGF0ZSwgaW50IHRpbWVvdXRfdXMpOworaW50IGRtX21tY19ob3N0X3Bvd2VyX2N5
Y2xlKHN0cnVjdCB1ZGV2aWNlICpkZXYpOwogCiAvKiBUcmFuc2l0aW9uIGZ1bmN0aW9ucyBmb3Ig
Y29tcGF0aWJpbGl0eSAqLwogaW50IG1tY19zZXRfaW9zKHN0cnVjdCBtbWMgKm1tYyk7CkBAIC00
ODUsNiArNDk2LDcgQEAgaW50IG1tY19nZXR3cChzdHJ1Y3QgbW1jICptbWMpOwogaW50IG1tY19l
eGVjdXRlX3R1bmluZyhzdHJ1Y3QgbW1jICptbWMsIHVpbnQgb3Bjb2RlKTsKIGludCBtbWNfd2Fp
dF9kYXQwKHN0cnVjdCBtbWMgKm1tYywgaW50IHN0YXRlLCBpbnQgdGltZW91dF91cyk7CiBpbnQg
bW1jX3NldF9lbmhhbmNlZF9zdHJvYmUoc3RydWN0IG1tYyAqbW1jKTsKK2ludCBtbWNfaG9zdF9w
b3dlcl9jeWNsZShzdHJ1Y3QgbW1jICptbWMpOwogCiAjZWxzZQogc3RydWN0IG1tY19vcHMgewpA
QCAtNDk0LDYgKzUwNiw3IEBAIHN0cnVjdCBtbWNfb3BzIHsKIAlpbnQgKCppbml0KShzdHJ1Y3Qg
bW1jICptbWMpOwogCWludCAoKmdldGNkKShzdHJ1Y3QgbW1jICptbWMpOwogCWludCAoKmdldHdw
KShzdHJ1Y3QgbW1jICptbWMpOworCWludCAoKmhvc3RfcG93ZXJfY3ljbGUpKHN0cnVjdCBtbWMg
Km1tYyk7CiB9OwogI2VuZGlmCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
