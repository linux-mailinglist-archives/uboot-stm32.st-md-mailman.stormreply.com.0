Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BAD3D2638
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 16:51:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78ED1C5A4CD;
	Thu, 22 Jul 2021 14:51:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABD14C57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 14:51:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MEhgvn027821; Thu, 22 Jul 2021 16:51:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=EOr8ze4SkAHRaGTBRqUrGFzbXwyJtTZT254TqCg2oY4=;
 b=OjYYuToDqwYDbCGtaCajHIjzAWNP0a487sG+mf4xVZKj2EklmcJjnJz4QJZzJhBgrfGL
 S07pNLdnakvSk6nbW5TWygu5/x0IMTixVP/e08lwEhsIrj0hpjAg5SFZkOIHXthJbal7
 nPTmv8x9bWuChIQAyNQ02vzkD19p2R9Q7vOHU0zJzRglyxwXIoxO3mjkJ8fqDnMqxoc9
 b33TRvDbyVvn+Zi1WdyNo1Qo4BOsRfmuPllB93z5bq7+g7TgSmyuuEWZbt0hpCmrpa3j
 akpSyXxXV9+kOkQBn5m6zKZFJIRg67k/OAuNM+6SpWXLy2ZxbhIKTQPuhmyeEFagCRYx hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39y43wtbqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 16:51:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DE7E10002A;
 Thu, 22 Jul 2021 16:51:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 330AD226FBF;
 Thu, 22 Jul 2021 16:51:44 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 22 Jul 2021 16:51:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 22 Jul 2021 16:51:42 +0200
Message-ID: <20210722165101.v2.1.I6630d4cc18870d3e830587ffbcb61898dc045cb6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_09:2021-07-22,
 2021-07-22 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH v2] patman: add warning for invalid tag
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

QWRkIGEgZXJyb3IgaW4gcGF0bWFuIHRvb2wgd2hlbiB0aGUgY29tbWl0IG1lc3NhZ2UgY29udGVu
dHMgYW4gaW52YWxpZAp0YWcgIlNlcmllLS4qIiBpbnN0ZWFkIG9mICJTZXJpZXMtLioiLgoKU2ln
bmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNv
bT4KCi0tLQpJIGNyZWF0ZSB0aGlzIHBhdGNoIHRvIGF2b2lkIG15IGZyZXF1ZW50IG1pc3Rha2U6
CnVzaW5nICJTZXJpZS0iIHRhZyBpbnN0ZWFkIG9mICJTZXJpZXMtIiBhcyBpdCBpcyBkb25lIGlu
IFsxXS4KClJFX0lOVl9UQUcgY2FuIGJlIGV4dGVuZGVkIHRvIG90aGVyIGZyZXF1ZW50IGVycm9y
cy4KCkFueSAiU2VyaWUtIiB0YWcgaXMgcmVmdXNlZCB3aXRoIHRoZSBwYXRjaCwgZm9yIGV4YW1w
bGU6CgpWYWx1ZUVycm9yOiBMaW5lIDI4OiBJbnZhbGlkIHRhZyA9CiAgICdTZXJpZS1jYzogTWFy
ZWsgQmVow7puIDxtYXJlay5iZWh1bkBuaWMuY3o+JwoKWzFdIGh0dHA6Ly9wYXRjaHdvcmsub3ps
YWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjEwNzIwMjAzMzUzLjEuSTU1MGI5NWY2ZDEy
ZDU5YWVlZjViNzQ0ZDgzN2RiYjM2MDAzN2QzOWVAY2hhbmdlaWQvCgoKQ2hhbmdlcyBpbiB2MjoK
LSBhZGQgcGF0bWFuIHRlc3QgdGVzdEludmFsaWRUYWcKCiB0b29scy9wYXRtYW4vZnVuY190ZXN0
LnB5ICAgfCAxMSArKysrKysrKysrKwogdG9vbHMvcGF0bWFuL3BhdGNoc3RyZWFtLnB5IHwgIDkg
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90b29scy9wYXRtYW4vZnVuY190ZXN0LnB5IGIvdG9vbHMvcGF0bWFuL2Z1bmNfdGVzdC5weQpp
bmRleCAxY2U2NDQ4ZDAwLi45ODcxYmI1ODBkIDEwMDY0NAotLS0gYS90b29scy9wYXRtYW4vZnVu
Y190ZXN0LnB5CisrKyBiL3Rvb2xzL3BhdG1hbi9mdW5jX3Rlc3QucHkKQEAgLTUwNiw2ICs1MDYs
MTcgQEAgVGVzdGVkLWJ5OiAlcwogICAgICAgICAgICAgJ1Jldmlld2VkLWJ5Jzoge3NlbGYuam9l
LCBzZWxmLm1hcnl9LAogICAgICAgICAgICAgJ1Rlc3RlZC1ieSc6IHtzZWxmLmxlYn19KQogCisg
ICAgZGVmIHRlc3RJbnZhbGlkVGFnKHNlbGYpOgorICAgICAgICAiIiJUZXN0IGludmFsaWQgdGFn
IGluIGEgcGF0Y2hzdHJlYW0iIiIKKyAgICAgICAgdGV4dCA9ICcnJ1RoaXMgaXMgYSBwYXRjaAor
CitTZXJpZS12ZXJzaW9uOiAyCisnJycKKyAgICAgICAgd2l0aCBzZWxmLmFzc2VydFJhaXNlcyhW
YWx1ZUVycm9yKSBhcyBleGM6CisgICAgICAgICAgICBwc3RybSA9IFBhdGNoU3RyZWFtLnByb2Nl
c3NfdGV4dCh0ZXh0KQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKCJMaW5lIDM6IEludmFsaWQg
dGFnID0gJ1NlcmllLXZlcnNpb246IDInIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHIo
ZXhjLmV4Y2VwdGlvbikpCisKICAgICBkZWYgdGVzdE1pc3NpbmdFbmQoc2VsZik6CiAgICAgICAg
ICIiIlRlc3QgYSBtaXNzaW5nIEVORCB0YWciIiIKICAgICAgICAgdGV4dCA9ICcnJ1RoaXMgaXMg
YSBwYXRjaApkaWZmIC0tZ2l0IGEvdG9vbHMvcGF0bWFuL3BhdGNoc3RyZWFtLnB5IGIvdG9vbHMv
cGF0bWFuL3BhdGNoc3RyZWFtLnB5CmluZGV4IGE0NGNkODYxYWYuLmI5NjAyOTI0MjcgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3BhdG1hbi9wYXRjaHN0cmVhbS5weQorKysgYi90b29scy9wYXRtYW4vcGF0
Y2hzdHJlYW0ucHkKQEAgLTU5LDYgKzU5LDkgQEAgUkVfRElGRiA9IHJlLmNvbXBpbGUocidePi4q
ZGlmZiAtLWdpdCBhLyguKikgYi8oLiopJCcpCiAjIERldGVjdCBhIGNvbnRleHQgbGluZSwgbGlr
ZSAnPiBAQCAtMTUzLDggKzE1MywxMyBAQCBDaGVja1BhdGNoCiBSRV9MSU5FID0gcmUuY29tcGls
ZShyJz4uKkBAIFwtKFxkKyksXGQrIFwrKFxkKyksXGQrIEBAICooLiopJykKIAorIyBEZXRlY3Qg
bGluZSB3aXRoIGludmFsaWQgVEFHCitSRV9JTlZfVEFHID0gcmUuY29tcGlsZSgnXlNlcmllLShb
YS16LV0qKTogKiguKiknKQorCiAjIFN0YXRlcyB3ZSBjYW4gYmUgaW4gLSBjYW4gd2UgdXNlIHJh
bmdlKCkgYW5kIHN0aWxsIGhhdmUgY29tbWVudHM/CiBTVEFURV9NU0dfSEVBREVSID0gMCAgICAg
ICAgIyBTdGlsbCBpbiB0aGUgbWVzc2FnZSBoZWFkZXIKIFNUQVRFX1BBVENIX1NVQkpFQ1QgPSAx
ICAgICAjIEluIHBhdGNoIHN1YmplY3QgKGZpcnN0IGxpbmUgb2YgbG9nIGZvciBhIGNvbW1pdCkK
QEAgLTMxOCw2ICszMjEsNyBAQCBjbGFzcyBQYXRjaFN0cmVhbToKICAgICAgICAgbGVhZGluZ193
aGl0ZXNwYWNlX21hdGNoID0gUkVfTEVBRElOR19XSElURVNQQUNFLm1hdGNoKGxpbmUpCiAgICAg
ICAgIGRpZmZfbWF0Y2ggPSBSRV9ESUZGLm1hdGNoKGxpbmUpCiAgICAgICAgIGxpbmVfbWF0Y2gg
PSBSRV9MSU5FLm1hdGNoKGxpbmUpCisgICAgICAgIGludmFsaWRfbWF0Y2ggPSBSRV9JTlZfVEFH
Lm1hdGNoKGxpbmUpCiAgICAgICAgIHRhZ19tYXRjaCA9IE5vbmUKICAgICAgICAgaWYgc2VsZi5z
dGF0ZSA9PSBTVEFURV9QQVRDSF9IRUFERVI6CiAgICAgICAgICAgICB0YWdfbWF0Y2ggPSBSRV9U
QUcubWF0Y2gobGluZSkKQEAgLTQ3MSw2ICs0NzUsMTEgQEAgY2xhc3MgUGF0Y2hTdHJlYW06CiAg
ICAgICAgICAgICAgICAgc2VsZi5fYWRkX3dhcm4oJ0xpbmUgJWQ6IElnbm9yaW5nIENvbW1pdC0l
cycgJQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzZWxmLmxpbmVudW0sIG5hbWUp
KQogCisgICAgICAgICMgRGV0ZWN0IGludmFsaWQgdGFncworICAgICAgICBlbGlmIGludmFsaWRf
bWF0Y2g6CisgICAgICAgICAgICByYWlzZSBWYWx1ZUVycm9yKCJMaW5lICVkOiBJbnZhbGlkIHRh
ZyA9ICclcyciICUKKyAgICAgICAgICAgICAgICAoc2VsZi5saW5lbnVtLCBsaW5lKSkKKwogICAg
ICAgICAjIERldGVjdCB0aGUgc3RhcnQgb2YgYSBuZXcgY29tbWl0CiAgICAgICAgIGVsaWYgY29t
bWl0X21hdGNoOgogICAgICAgICAgICAgc2VsZi5fY2xvc2VfY29tbWl0KCkKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3Rt
MzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJv
b3Qtc3RtMzIK
