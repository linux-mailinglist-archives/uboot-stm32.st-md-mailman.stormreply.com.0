Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265C216CAD
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 14:22:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53C54C36B29
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Jul 2020 12:22:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4587C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 12:21:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067CLmCx029437; Tue, 7 Jul 2020 14:21:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=rSePU0NH8a8LyYJcwEOxl3sdqu8z/Z0L/H4qQEJu8pE=;
 b=TN13V17n7gIDBgRqR/p4PBc8lFl2nAZ9DspVMPHVTnFiqWQyNApd0ewWBO5YtS+10i7G
 1E0ihIUIEhEv/5uwarrLxamGcfzVOC23QsLI5O7JOd14wbzNj/wUQwuvOyTod9fsWSgt
 +6mJ22W6PSQV8WNp9X/qt/a2qORjsKIksL9BIF18otLfshSnkGVSkHkaF9KOumhWQcPk
 ZsBUzLR8qZSlA2/5u+XVSmsJ+wqynKSbP/XkXPdpTvYWZD5YYelOH/i6hQ7vWHlaB9nx
 8EjrrD8HUMN/Vo2uqwXTahPnB20IjzLlzrg/mTRqSbvSLBZ5++GVxEkJbhUJpSdMyr7v ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfgu9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 14:21:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 090DD100034;
 Tue,  7 Jul 2020 14:21:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC0F52BC7DF;
 Tue,  7 Jul 2020 14:21:55 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 7 Jul 2020 14:21:55 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Jul 2020 14:21:53 +0200
Message-ID: <20200707122153.9624-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_07:2020-07-07,
 2020-07-07 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: use correct weak function name
	spl_board_prepare_for_linux
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

UmVwbGFjZSB0aGUgZnVuY3Rpb24gc3BsX2JvYXJkX3ByZXBhcmVfZm9yX2Jvb3RfbGludXggYnkg
dGhlIGNvcnJlY3QKbmFtZSBvZiB0aGUgd2VhayBmdW5jdGlvbiBzcGxfYm9hcmRfcHJlcGFyZV9m
b3JfbGludXggZGVmaW5lZCBpbiBzcGwuaC4KClRoaXMgcGF0Y2ggYXZvaWRzIHdhcm5pbmcgd2l0
aCBXPTEgb3B0aW9uOgoKdS1ib290L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwuYzoxNTA6NjoK
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhzcGxfYm9hcmRfcHJlcGFyZV9m
b3JfYm9vdF9saW51eOKAmQpbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpGaXhlczogZGM3ZTVmMTkw
ZGU1ICgiYXJtOiBzdG0zMm1wOiBhY3RpdmF0ZSBkYXRhIGNhY2hlIG9uIEREUiBpbiBTUEwiKQpT
aWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4K
LS0tCgogYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFj
aC1zdG0zMm1wL3NwbC5jIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jCmluZGV4IDM5NDEz
ZTlhMGUuLmU4NGJkYWQ3YmYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9zcGwu
YworKysgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvc3BsLmMKQEAgLTE0Nyw3ICsxNDcsNyBAQCB2
b2lkIHNwbF9ib2FyZF9wcmVwYXJlX2Zvcl9ib290KHZvaWQpCiAJZGNhY2hlX2Rpc2FibGUoKTsK
IH0KIAotdm9pZCBzcGxfYm9hcmRfcHJlcGFyZV9mb3JfYm9vdF9saW51eCh2b2lkKQordm9pZCBz
cGxfYm9hcmRfcHJlcGFyZV9mb3JfbGludXgodm9pZCkKIHsKIAlkY2FjaGVfZGlzYWJsZSgpOwog
fQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
