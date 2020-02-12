Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4284915AFF9
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:38:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09D52C36B12
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:38:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B1FC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:38:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIYYRq011095; Wed, 12 Feb 2020 19:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=hFd4qkH2DKH5PfD+pyPyautPZYKDd+yYlfon/FMdAz8=;
 b=z7LMQ3RAfn1mmxdu47ySsJivTxuyYA3flTyhIefoq0qD86QH3skOObc3tVw/pg50bsSS
 Q99LPBCdm3gpO11f7DQlfkXu0MQUXFAFxpBoBvOC1g4rGx1XCLGpTPcqppWqz++YTzzG
 60qZZgrYQ+Y+5jsG5k0zQpKVMgcjpJdA1cN3RSZN6XYqa4A4/FTgOnQA31Ibo673wxfh
 Rgt0/3PRpGgYgWuHI1ZUHTl1XepGnSyj6qDS/disrrQROBb0GNKU5V4PC3NjThvR3PqP
 rTQf+H+viA9uhXOK8yuhvGCsn1En24rU52VY+iM1Xw9tWfu12inl/LtMwhG7+0aElXxa sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhgbeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:38:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B51FF100086;
 Wed, 12 Feb 2020 19:37:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABC872C60AA;
 Wed, 12 Feb 2020 19:37:49 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:37:49 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:37:37 +0100
Message-ID: <20200212183744.5309-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183744.5309-1-patrick.delaunay@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/10] arm: stm32mp: bsec: remove unneeded test
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

UmVtb3ZlIHRoZSB0ZXN0IG9mZnMgPCAwICwgYXMgb2ZmcyBpcyB1bnNpZ25lZC4KClRoaXMgcGF0
Y2ggc29sdmVzIHRoZSB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyB3aXRoIFc9MQpvbiBzdG0zMm1w
MSBib2FyZDoKCkluIGZ1bmN0aW9uIOKAmHN0bTMybXBfYnNlY19yZWFk4oCZOgphcmNoL2FybS9t
YWNoLXN0bTMybXAvYnNlYy5jOjM2ODoxMTogd2FybmluZzoKY29tcGFyaXNvbiBvZiB1bnNpZ25l
ZCBleHByZXNzaW9uIDwgMCBpcyBhbHdheXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdCiAgMzY4IHwg
IGlmIChvZmZzIDwgMCB8fCAob2ZmcyAlIDQpIHx8IChzaXplICUgNCkpCiAgICAgIHwgICAgICAg
ICAgIF4KSW4gZnVuY3Rpb24g4oCYc3RtMzJtcF9ic2VjX3dyaXRl4oCZOgphcmNoL2FybS9tYWNo
LXN0bTMybXAvYnNlYy5jOjQwNToxMTogd2FybmluZzoKY29tcGFyaXNvbiBvZiB1bnNpZ25lZCBl
eHByZXNzaW9uIDwgMCBpcyBhbHdheXMgZmFsc2UgWy1XdHlwZS1saW1pdHNdCiAgNDA1IHwgIGlm
IChvZmZzIDwgMCB8fCAob2ZmcyAlIDQpIHx8IChzaXplICUgNCkpCiAgICAgIHwgICAgICAgICAg
IF4KClNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAc3Qu
Y29tPgotLS0KCiBhcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5jIHwgNCArKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL21hY2gtc3RtMzJtcC9ic2VjLmMgYi9hcmNoL2FybS9tYWNoLXN0bTMybXAvYnNlYy5j
CmluZGV4IGE3N2M3MDZhMWEuLjFkOTA0Y2FhZTEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gt
c3RtMzJtcC9ic2VjLmMKKysrIGIvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2JzZWMuYwpAQCAtMzY1
LDcgKzM2NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJtcF9ic2VjX3JlYWQoc3RydWN0IHVkZXZpY2Ug
KmRldiwgaW50IG9mZnNldCwKIAkJc2hhZG93ID0gZmFsc2U7CiAJfQogCi0JaWYgKG9mZnMgPCAw
IHx8IChvZmZzICUgNCkgfHwgKHNpemUgJSA0KSkKKwlpZiAoKG9mZnMgJSA0KSB8fCAoc2l6ZSAl
IDQpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCW90cCA9IG9mZnMgLyBzaXplb2YodTMyKTsKQEAg
LTQwMiw3ICs0MDIsNyBAQCBzdGF0aWMgaW50IHN0bTMybXBfYnNlY193cml0ZShzdHJ1Y3QgdWRl
dmljZSAqZGV2LCBpbnQgb2Zmc2V0LAogCQlzaGFkb3cgPSBmYWxzZTsKIAl9CiAKLQlpZiAob2Zm
cyA8IDAgfHwgKG9mZnMgJSA0KSB8fCAoc2l6ZSAlIDQpKQorCWlmICgob2ZmcyAlIDQpIHx8IChz
aXplICUgNCkpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJb3RwID0gb2ZmcyAvIHNpemVvZih1MzIp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
