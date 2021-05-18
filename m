Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A853879A0
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 May 2021 15:12:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 364FAC5978F;
	Tue, 18 May 2021 13:12:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B522C5978E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 13:12:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ID6jX9016726; Tue, 18 May 2021 15:12:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=WmO9ygKnAPc+41z9wbDF49QC40M3Q4tdh7gWPARe44E=;
 b=Je7z+cBU3NFpUTPIh4W4ZHWbXDlqbe181k0cMsE1qAg6HgtBdXZ78nIYAsTE7B5CXiCm
 rkkGo0HLZ3D/QPhnzvtj3/ts6KIbZUuE0s6n5TWKgjPQxswhf1cZ1MmkSwNfd8PqlzXB
 n4UuQ4VTPR8ZVfK1CaLDmz4nFmjJLZDvcDfOn3tXoyZ6fS6th+Q10/3FGF2OsN/ttW/Z
 s5k0K+nr4w7SqIoPeNYCa6Y9quuLv8zijdrNeFZWVc5lYeumk/0SZRlUC1JzoIidys1G
 cwLqZRbgaEI3UV3uJFgfoJmngxEa51DwE3xdp7H5mAczAHEGX+HvJ/xMnWvwc8pOkGVs eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38mda9gcb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 May 2021 15:12:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53B86100038;
 Tue, 18 May 2021 15:12:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A3E02275E0;
 Tue, 18 May 2021 15:12:21 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May 2021 15:12:20
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 May 2021 15:12:07 +0200
Message-ID: <20210518151206.4.I44c0cbd50fa01f82729d1d6d435d0f663b9e7dcb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
References: <20210518131213.20343-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-18_04:2021-05-18,
 2021-05-18 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick
 Delaunay <patrick.delaunay@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 04/10] stm32mp: stm32prog: solve compilation
	with CONFIG_FIT_SIGNATURE
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

V2hlbiBDT05GSUdfRklUX1NJR05BVFVSRSBpcyBhY3RpdmF0ZWQsIENPTkZJR19MRUdBQ1lfSU1B
R0VfRk9STUFUCmlzIGRlYWN0aXZhdGVkIGFuZCB0aGUgZGVmaW5lIElNQUdFX0ZPUk1BVF9MRUdB
Q1kgZG9uJ3QgZXhpc3Qgd2l0aAppbmNsdWRlL2ltYWdlLmg6CiAgI2lmIGRlZmluZWQoQ09ORklH
X0xFR0FDWV9JTUFHRV9GT1JNQVQpCiAgI2RlZmluZSBJTUFHRV9GT1JNQVRfTEVHQUNZCTB4MDEJ
LyogbGVnYWN5IGltYWdlX2hlYWRlciBiYXNlZCBmb3JtYXQgKi8KICAjZW5kaWYKClRoaXMgcGF0
Y2ggYWRkcyB0aGUgbmVlZGVkIGNoZWNrIG9uIGNvbXBpbGF0aW9uIGZsYWcKQ09ORklHX0xFR0FD
WV9JTUFHRV9GT1JNQVQgdG8gYXZvaWQgdGhlIGNvbXBpbGF0aW9uIGVycm9yCmZvciBjb21tYW5k
IHN0bTMycHJvZzoKCmNtZF9zdG0zMnByb2cuYzo4MTo4OiBlcnJvcjog4oCYSU1BR0VfRk9STUFU
X0xFR0FDWeKAmSB1bmRlY2xhcmVkCihmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5
b3UgbWVhbiDigJhJTUFHRV9GT1JNQVRfRklU4oCZPwogICA4MSB8ICAgIGlmIChJTUFHRV9GT1JN
QVRfTEVHQUNZID09CiAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAgfCAg
ICAgICAgSU1BR0VfRk9STUFUX0ZJVAoKU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KLS0tCgogYXJjaC9hcm0vbWFjaC1zdG0zMm1w
L2NtZF9zdG0zMnByb2cvY21kX3N0bTMycHJvZy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3Rt
MzJwcm9nL2NtZF9zdG0zMnByb2cuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJw
cm9nL2NtZF9zdG0zMnByb2cuYwppbmRleCBlNTg0YmI1MmJkLi5mMzc5MGY5MDBmIDEwMDY0NAot
LS0gYS9hcmNoL2FybS9tYWNoLXN0bTMybXAvY21kX3N0bTMycHJvZy9jbWRfc3RtMzJwcm9nLmMK
KysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMnByb2cvY21kX3N0bTMycHJvZy5j
CkBAIC03NywxMCArNzcsMTIgQEAgc3RhdGljIGludCBkb19zdG0zMnByb2coc3RydWN0IGNtZF90
YmwgKmNtZHRwLCBpbnQgZmxhZywgaW50IGFyZ2MsCiAJCWlmIChoZWFkZXIudHlwZSA9PSBIRUFE
RVJfU1RNMzJJTUFHRSkgewogCQkJc2l6ZSA9IGhlYWRlci5pbWFnZV9sZW5ndGggKyBCTF9IRUFE
RVJfU0laRTsKIAorI2lmIGRlZmluZWQoQ09ORklHX0xFR0FDWV9JTUFHRV9GT1JNQVQpCiAJCQkv
KiB1SW1hZ2UgZGV0ZWN0ZWQgaW4gU1RNMzJJTUFHRSwgZXhlY3V0ZSB0aGUgc2NyaXB0ICovCiAJ
CQlpZiAoSU1BR0VfRk9STUFUX0xFR0FDWSA9PQogCQkJICAgIGdlbmltZ19nZXRfZm9ybWF0KCh2
b2lkICopKGFkZHIgKyBCTF9IRUFERVJfU0laRSkpKQogCQkJCXJldHVybiBpbWFnZV9zb3VyY2Vf
c2NyaXB0KGFkZHIgKyBCTF9IRUFERVJfU0laRSwgInNjcmlwdEAxIik7CisjZW5kaWYKIAkJfQog
CX0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
