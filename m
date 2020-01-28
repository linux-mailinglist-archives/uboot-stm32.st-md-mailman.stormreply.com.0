Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786A14B1F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 10:44:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6256AC36B0E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 09:44:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E6B1C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 09:44:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00S9hKjd010478; Tue, 28 Jan 2020 10:44:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=1OIpBXSOxnvwHvOsRvuwC+5EMaEY8rKLIGcApeLeQXw=;
 b=F0mn6c9jIU/VdXtrXzNGp99jwY5qnBdwIGIFh4h+6bP0Yxk++uCn/56OmrgaVM+de2q/
 R3AfV6DL+vj3OuDwQ4zf+waZZQE2mYNqOz04oJA16lvinRl+XeW+yvndJh1m/OH4vsG8
 CjuKK9wbbjAzLyeKTvWqyfLO73uAxMLMrBNO7WZ134GGtitMR8FRbQBd1TyBShAWN7Dp
 RFeD+Hadysc6gblfBogLnRUbg98YcbAOBcUTgYytCOXnPScx0aWgVvxNQvgy2qAkPFxb
 z8w6dvbH9IL9VXVAGmQUbTxFhiV+EgfmA593Us/Zoy6FBuu2XRCKqL69WG9wep1Xj3mU bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrbpawaan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 10:44:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5442E10003E;
 Tue, 28 Jan 2020 10:44:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D35E21CA8C;
 Tue, 28 Jan 2020 10:44:21 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 10:44:20 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 10:44:15 +0100
Message-ID: <20200128094415.5768-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128094415.5768-1-patrick.delaunay@st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_02:2020-01-24,
 2020-01-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH 4/4] clk: stm32mp1: solve type issue in
	stm32mp1_lse_enable and stm32mp1_clktree
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

U29sdmUgdHlwZSBpc3N1ZSBpbiBzdG0zMm1wMV9sc2VfZW5hYmxlIGFuZCBzdG0zMm1wMV9jbGt0
cmVlLgoKVGhpcyBwYXRjaCBzb2x2ZXMgdGhlIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIHdpdGgg
Vz0xCm9uIHN0bTMybXAxIGJvYXJkOgoKY2xrX3N0bTMybXAxLmM6IEluIGZ1bmN0aW9uIOKAmHN0
bTMybXAxX2xzZV9lbmFibGXigJk6CmNsa19zdG0zMm1wMS5jOjEyMzg6MTU6IHdhcm5pbmc6IGNv
bXBhcmlzb24gb2YgaW50ZWdlciBleHByZXNzaW9ucwogIG9mIGRpZmZlcmVudCBzaWduZWRuZXNz
OiDigJh1MzLigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhpbnTigJkKICBbLVdz
aWduLWNvbXBhcmVdCmNsa19zdG0zMm1wMS5jOjEyMzk6MTM6IHdhcm5pbmc6IGNvbXBhcmlzb24g
b2YgaW50ZWdlciBleHByZXNzaW9ucwogIG9mIGRpZmZlcmVudCBzaWduZWRuZXNzOiDigJh1MzLi
gJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IGFuZCDigJhpbnTigJkKICBbLVdzaWduLWNvbXBh
cmVdCgpjbGtfc3RtMzJtcDEuYzogSW4gZnVuY3Rpb24g4oCYc3RtMzJtcDFfY2xrdHJlZeKAmToK
Y2xrX3N0bTMybXAxLmM6MTgxNDoxNzogd2FybmluZzogY29tcGFyaXNvbiBvZiBpbnRlZ2VyIGV4
cHJlc3Npb25zCiAgb2YgZGlmZmVyZW50IHNpZ25lZG5lc3M6IOKAmGludOKAmSBhbmQg4oCYdW5z
aWduZWQgaW504oCZCiAgWy1Xc2lnbi1jb21wYXJlXQoKU2lnbmVkLW9mZi1ieTogUGF0cmljayBE
ZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Ci0tLQoKIGRyaXZlcnMvY2xrL2Nsa19z
dG0zMm1wMS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrX3N0bTMybXAxLmMg
Yi9kcml2ZXJzL2Nsay9jbGtfc3RtMzJtcDEuYwppbmRleCBkYTY2YmRlNDFiLi5mZDhjODIxZTQ4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGtfc3RtMzJtcDEuYworKysgYi9kcml2ZXJzL2Ns
ay9jbGtfc3RtMzJtcDEuYwpAQCAtMTIxOCw3ICsxMjE4LDcgQEAgc3RhdGljIGludCBzdG0zMm1w
MV9vc2Nfd2FpdChpbnQgZW5hYmxlLCBmZHRfYWRkcl90IHJjYywgdTMyIG9mZnNldCwKIH0KIAog
c3RhdGljIHZvaWQgc3RtMzJtcDFfbHNlX2VuYWJsZShmZHRfYWRkcl90IHJjYywgaW50IGJ5cGFz
cywgaW50IGRpZ2J5cCwKLQkJCQlpbnQgbHNlZHJ2KQorCQkJCXUzMiBsc2VkcnYpCiB7CiAJdTMy
IHZhbHVlOwogCkBAIC0xNjUxLDggKzE2NTEsOCBAQCBzdGF0aWMgaW50IHN0bTMybXAxX2Nsa3Ry
ZWUoc3RydWN0IHVkZXZpY2UgKmRldikKIAl1bnNpZ25lZCBpbnQgY2xrZGl2W0NMS0RJVl9OQl07
CiAJdW5zaWduZWQgaW50IHBsbGNmZ1tfUExMX05CXVtQTExDRkdfTkJdOwogCW9mbm9kZSBwbGxv
ZmZbX1BMTF9OQl07Ci0JaW50IHJldDsKLQlpbnQgaSwgbGVuOworCWludCByZXQsIGxlbjsKKwl1
aW50IGk7CiAJaW50IGxzZV9jc3MgPSAwOwogCWNvbnN0IHUzMiAqcGtjc19jZWxsOwogCkBAIC0x
Njk4LDcgKzE2OTgsOCBAQCBzdGF0aWMgaW50IHN0bTMybXAxX2Nsa3RyZWUoc3RydWN0IHVkZXZp
Y2UgKmRldikKIAkJc3RtMzJtcDFfbHNpX3NldChyY2MsIDEpOwogCiAJaWYgKHByaXYtPm9zY1tf
TFNFXSkgewotCQlpbnQgYnlwYXNzLCBkaWdieXAsIGxzZWRydjsKKwkJaW50IGJ5cGFzcywgZGln
YnlwOworCQl1MzIgbHNlZHJ2OwogCQlzdHJ1Y3QgdWRldmljZSAqZGV2ID0gcHJpdi0+b3NjX2Rl
dltfTFNFXTsKIAogCQlieXBhc3MgPSBkZXZfcmVhZF9ib29sKGRldiwgInN0LGJ5cGFzcyIpOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby91Ym9vdC1zdG0zMgo=
