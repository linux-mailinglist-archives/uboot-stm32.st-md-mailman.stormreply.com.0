Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4D1BF1D0
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 09:52:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB559C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 07:52:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25412C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 07:52:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U7mWlq002819; Thu, 30 Apr 2020 09:52:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=TtFzupkqRw6QTkLMMGSzgcENYSnJC8ZJBqwk9OncRJI=;
 b=Bwm58NFZMzKbkT+plBHwJWJqX31EmI1UysMsA2CHFX9CVx+ViGeE1Wze3f9AxfO788JM
 gP5zJ/4z5vKJIseJ7K2bgJ7GSaFJ3YInaHSxEyf1nxTShQFq4jDSO7kxo47Lw0pulWbI
 8Tf0sQv2Z775tUOcUPFmcxooELNfiPuDG+S0oejH23M5NIMemL/UFJJG6pBumiafpMkx
 +UIWLjuJcz9MRNH21gk4MlP03l40C6g8Wcw7s9olNDiaaKjQMobgkPkHOZw/SHyZuRpX
 x9T6gyhHY3gY+VXwd/qMqqHucOQrzUMUCCbdOIDFYDypReMLx28TNSA8HAHf4VRBSCzi tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6aryv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 09:52:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 23850100034;
 Thu, 30 Apr 2020 09:52:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0799E2AAF69;
 Thu, 30 Apr 2020 09:52:19 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 09:52:18 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 09:52:13 +0200
Message-ID: <20200430095210.1.I4bda9fd7fdf1c7fe42323749ad1977dc690e14db@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_02:2020-04-30,
 2020-04-30 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Peng Fan <peng.fan@nxp.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: change the displayed
	config name
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

Q2hhbmdlIHRoZSBtbWMgZGlzcGxheWVkIG5hbWUgaW4gVS1Cb290IGZvciBzdG0zMl9zZG1tYzIg
ZHJpdmVyIHRvCuKAnFNUTTMyIFNEL01NQ+KAnS4KClRoaXMgc3RtMzJfc2RtbWMyIGRyaXZlciBp
cyBmb3IgdmVyc2lvbiAyIG9mIHRoZSBTVCBIVyBJUCBTRE1NQyBidXQgdGhlCmRpc3BsYXllZCBu
YW1lICJTVE0zMiBTRE1NQzIiIGlzIGNvbmZ1c2luZyBmb3IgdXNlciwgYmV0d2VlbiB0aGUKaW5z
dGFuY2Ugb2YgU0RNTUMgYW5kIHRoZSBkZXZpY2UgaWRlbnRpZmllciBvZiBNTUMuCgpGb3IgZXhh
bXBsZSBvbiBFVjEgYm9hcmQsIHdlIGhhdmU6CgpTVE0zMk1QMT4gbW1jIGxpc3QKIFNUTTMyIFNE
TU1DMjogMCAoU0QpCiBTVE0zMiBTRE1NQzI6IDEgKGVNTUMpCgpDaGFuZ2VkIHRvIG1vcmUgY2xl
YXI6CgpTVE0zMk1QMT4gbW1jIGxpc3QKIFNUTTMyIFNEL01NQzogMCAoU0QpCiBTVE0zMiBTRC9N
TUM6IDEgKGVNTUMpCgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QHN0LmNvbT4KLS0tCgogZHJpdmVycy9tbWMvc3RtMzJfc2RtbWMyLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21tYy9zdG0zMl9zZG1tYzIuYyBiL2RyaXZlcnMvbW1jL3N0bTMyX3NkbW1jMi5j
CmluZGV4IDZmM2IyYWQ2NTMuLmZhNmZjOTRhZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL3N0
bTMyX3NkbW1jMi5jCisrKyBiL2RyaXZlcnMvbW1jL3N0bTMyX3NkbW1jMi5jCkBAIC02NzQsNyAr
Njc0LDcgQEAgc3RhdGljIGludCBzdG0zMl9zZG1tYzJfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRl
dikKIAljZmctPmZfbWF4ID0gZGV2X3JlYWRfdTMyX2RlZmF1bHQoZGV2LCAibWF4LWZyZXF1ZW5j
eSIsIDUyMDAwMDAwKTsKIAljZmctPnZvbHRhZ2VzID0gTU1DX1ZERF8zMl8zMyB8IE1NQ19WRERf
MzNfMzQgfCBNTUNfVkREXzE2NV8xOTU7CiAJY2ZnLT5iX21heCA9IENPTkZJR19TWVNfTU1DX01B
WF9CTEtfQ09VTlQ7Ci0JY2ZnLT5uYW1lID0gIlNUTTMyIFNETU1DMiI7CisJY2ZnLT5uYW1lID0g
IlNUTTMyIFNEL01NQyI7CiAKIAljZmctPmhvc3RfY2FwcyA9IDA7CiAJaWYgKGNmZy0+Zl9tYXgg
PiAyNTAwMDAwMCkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
