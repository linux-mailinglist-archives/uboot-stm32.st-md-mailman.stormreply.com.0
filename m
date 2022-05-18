Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1D52B296
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 May 2022 08:47:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A706DC03FC9;
	Wed, 18 May 2022 06:47:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1821C035BD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 May 2022 06:47:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I4MVVj005786;
 Wed, 18 May 2022 08:46:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=xQCGUw3oAk+kL4rFKAqo8c1MKNtPaBQktGPdUWMp8fI=;
 b=q+fcxusDRkn3BmiA1LkvC+glJuektBr4tfKrAx1i5acsAen0fTFnngAw4MlAagTgj3DG
 NIj0yngPyVwPDDY+2Oi+a13Sg6C0rE1j4S/2oAnx3ysJ//uAdUichfKOkYezDzpC7z7l
 WUqONiksCZhka4xKzFvs+Sph7DaiMcNvO+zr8eYWMO8HmNJaxnehyYlZicp0Dl7EKi/Q
 0RTXgAW0WJdbPQNkQ6jcFSGLCaR95TGAKA7kt9Bq/qmYvV0OONDXi8T2AH/9qpbjADxE
 0H/mO/0lQubEHYBYEGaOFyO/VXS4YyptYHrsSxYPBKZDIdhFmwylVs1U35Retd5fvIFS Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j8yc4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 08:46:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D9E1100034;
 Wed, 18 May 2022 08:46:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C90D20FA5C;
 Wed, 18 May 2022 08:46:52 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 18 May
 2022 08:46:52 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 May 2022 08:46:48 +0200
Message-ID: <20220518064648.1843664-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518064648.1843664-1-patrice.chotard@foss.st.com>
References: <20220518064648.1843664-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_02,2022-05-17_02,2022-02-23_01
Cc: Vignesh R <vigneshr@ti.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Igal Liberman <igall@marvell.com>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: [Uboot-stm32] [RESEND PATCH v4 3/3] test: dm: spi: Replace
	_spi_get_bus_and_cs() by spi_get_bus_and_cs() in some case
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

SW4gY2FzZSBfc3BpX2dldF9idXNfYW5kX2NzKCkncyBwYXJhbWV0ZXJzIGRydl9uYW1lIGFuZCBk
ZXZfbmFtZSBhcmUKcmVzcGVjdGl2ZWx5IHNldCB0byBOVUxMIGFuZCAwLCB1c2Ugc3BpX2dldF9i
dXNfYW5kX2NzKCkgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0
cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKQ2M6IE1hcmVrIEJlaHVuIDxtYXJlay5iZWh1bkBu
aWMuY3o+CkNjOiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KQ2M6IFZp
Z25lc2ggUiA8dmlnbmVzaHJAdGkuY29tPgpDYzogSm9lIEhlcnNoYmVyZ2VyIDxqb2UuaGVyc2hi
ZXJnZXJAbmkuY29tPgpDYzogUmFtb24gRnJpZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPgpDYzog
THVrYXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgpDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+CkNjOiBXb2xmZ2FuZyBEZW5rIDx3ZEBkZW54LmRlPgpDYzogU2ltb24gR2xhc3MgPHNq
Z0BjaHJvbWl1bS5vcmc+CkNjOiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+CkNjOiAiUGFsaSBS
b2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+CkNjOiBLb25zdGFudGluIFBvcm90Y2hraW4gPGtvc3Rh
cEBtYXJ2ZWxsLmNvbT4KQ2M6IElnYWwgTGliZXJtYW4gPGlnYWxsQG1hcnZlbGwuY29tPgpDYzog
QmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4KQ2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2
QHRpLmNvbT4KQ2M6IFNlYW4gQW5kZXJzb24gPHNlYW5nYTJAZ21haWwuY29tPgpDYzogQW5qaSBK
IDxhbmppLmphZ2FybG11ZGlAbnhwLmNvbT4KQ2M6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29t
PgpDYzogUHJpeWFua2EgSmFpbiA8cHJpeWFua2EuamFpbkBueHAuY29tPgpDYzogQ2hhaXRhbnlh
IFNha2luYW0gPGNoYWl0YW55YS5zYWtpbmFtQG54cC5jb20+Ci0tLQoKKG5vIGNoYW5nZXMgc2lu
Y2UgdjEpCgogdGVzdC9kbS9zcGkuYyB8IDE2ICsrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Qv
ZG0vc3BpLmMgYi90ZXN0L2RtL3NwaS5jCmluZGV4IDdhYjA4MjBhYmIuLjMyNTc5OWJiZjEgMTAw
NjQ0Ci0tLSBhL3Rlc3QvZG0vc3BpLmMKKysrIGIvdGVzdC9kbS9zcGkuYwpAQCAtNDYsOCArNDYs
NyBAQCBzdGF0aWMgaW50IGRtX3Rlc3Rfc3BpX2ZpbmQoc3RydWN0IHVuaXRfdGVzdF9zdGF0ZSAq
dXRzKQogCiAJLyogVGhpcyBmaW5kcyBub3RoaW5nIGJlY2F1c2Ugd2UgcmVtb3ZlZCB0aGUgZGV2
aWNlICovCiAJdXRfYXNzZXJ0ZXEoLUVOT0RFViwgc3BpX2ZpbmRfYnVzX2FuZF9jcyhidXNudW0s
IGNzLCAmYnVzLCAmZGV2KSk7Ci0JdXRfYXNzZXJ0ZXEoLUVOT0RFViwgX3NwaV9nZXRfYnVzX2Fu
ZF9jcyhidXNudW0sIGNzLCBzcGVlZCwgbW9kZSwKLQkJCQkJCSBOVUxMLCAwLCAmYnVzLCAmc2xh
dmUpKTsKKwl1dF9hc3NlcnRlcSgtRU5PREVWLCBzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBj
cywgJmJ1cywgJnNsYXZlKSk7CiAKIAkvKgogCSAqIFRoaXMgZm9yY2VzIHRoZSBkZXZpY2UgdG8g
YmUgcmUtYWRkZWQsIGJ1dCB0aGVyZSBpcyBubyBlbXVsYXRpb24KQEAgLTE0MywxNCArMTQyLDEy
IEBAIHN0YXRpYyBpbnQgZG1fdGVzdF9zcGlfY2xhaW1fYnVzKHN0cnVjdCB1bml0X3Rlc3Rfc3Rh
dGUgKnV0cykKIAlzdHJ1Y3QgdWRldmljZSAqYnVzOwogCXN0cnVjdCBzcGlfc2xhdmUgKnNsYXZl
X2EsICpzbGF2ZV9iOwogCXN0cnVjdCBkbV9zcGlfc2xhdmVfcGxhdCAqc2xhdmVfcGxhdDsKLQlj
b25zdCBpbnQgYnVzbnVtID0gMCwgY3NfYSA9IDAsIGNzX2IgPSAxLCBtb2RlID0gMDsKKwljb25z
dCBpbnQgYnVzbnVtID0gMCwgY3NfYSA9IDAsIGNzX2IgPSAxOwogCiAJLyogR2V0IHNwaSBzbGF2
ZSBvbiBDUzAgKi8KLQl1dF9hc3NlcnRvayhfc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Nf
YSwgMTAwMDAwMCwgbW9kZSwgTlVMTCwgMCwKLQkJCQkJJmJ1cywgJnNsYXZlX2EpKTsKKwl1dF9h
c3NlcnRvayhzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjc19hLCAmYnVzLCAmc2xhdmVfYSkp
OwogCS8qIEdldCBzcGkgc2xhdmUgb24gQ1MxICovCi0JdXRfYXNzZXJ0b2soX3NwaV9nZXRfYnVz
X2FuZF9jcyhidXNudW0sIGNzX2IsIDEwMDAwMDAsIG1vZGUsIE5VTEwsIDAsCi0JCQkJCSZidXMs
ICZzbGF2ZV9iKSk7CisJdXRfYXNzZXJ0b2soc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Nf
YiwgJmJ1cywgJnNsYXZlX2IpKTsKIAogCS8qIERpZmZlcmVudCBtYXhfaHosIGRpZmZlcmVudCBt
b2RlLiAqLwogCXV0X2Fzc2VydChzbGF2ZV9hLT5tYXhfaHogIT0gc2xhdmVfYi0+bWF4X2h6KTsK
QEAgLTE3OSwxMiArMTc2LDExIEBAIHN0YXRpYyBpbnQgZG1fdGVzdF9zcGlfeGZlcihzdHJ1Y3Qg
dW5pdF90ZXN0X3N0YXRlICp1dHMpCiB7CiAJc3RydWN0IHNwaV9zbGF2ZSAqc2xhdmU7CiAJc3Ry
dWN0IHVkZXZpY2UgKmJ1czsKLQljb25zdCBpbnQgYnVzbnVtID0gMCwgY3MgPSAwLCBtb2RlID0g
MDsKKwljb25zdCBpbnQgYnVzbnVtID0gMCwgY3MgPSAwOwogCWNvbnN0IGNoYXIgZG91dFs1XSA9
IHsweDlmfTsKIAl1bnNpZ25lZCBjaGFyIGRpbls1XTsKIAotCXV0X2Fzc2VydG9rKF9zcGlfZ2V0
X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgMTAwMDAwMCwgbW9kZSwgTlVMTCwgMCwKLQkJCQkJJmJ1
cywgJnNsYXZlKSk7CisJdXRfYXNzZXJ0b2soc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Ms
ICZidXMsICZzbGF2ZSkpOwogCXV0X2Fzc2VydG9rKHNwaV9jbGFpbV9idXMoc2xhdmUpKTsKIAl1
dF9hc3NlcnRvayhzcGlfeGZlcihzbGF2ZSwgNDAsIGRvdXQsIGRpbiwKIAkJCSAgICAgU1BJX1hG
RVJfQkVHSU4gfCBTUElfWEZFUl9FTkQpKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVi
b290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
