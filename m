Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3253D01C3
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:34:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96A81C597BD;
	Tue, 20 Jul 2021 18:34:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ADADCFAC5A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:34:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KIX8k2032525; Tue, 20 Jul 2021 20:34:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=guCKA2oHtKu2WeOnCg4xzBih3iKMUnbO5rimzQA0pDk=;
 b=GMllvH8z6M3QueGNOo9DiGutX4L5mofjjv4gg3VViiW5WxKTQ4QtleSPRK417/nqfRGa
 oOjic5c9x6DMA/o872xZT8U5wPuFLoelxO8P4JvHqn+OAlkCtDIWj4jPwZUI5rWb2EwI
 M/pHPQrhSG717LX5q9YtLNV1BeAaLNH9vES4W6M+FFtvut22o6kIqluDwhtbvhNCYhZg
 T3fduFowQI3fE6IKV85l1TNCeF8c4qpqhN/NFH/BcW4zcuTQogNd97V/40IMUTxuqWQE
 +m+aYvOJpt2BoPPATJPqIXSekjuETBRfkyapKvM8FyI7fa2h/SPYfMIKFtW03t+CPRJd PQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtu2k7sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:34:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C850C10002A;
 Tue, 20 Jul 2021 20:34:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0B8D237D86;
 Tue, 20 Jul 2021 20:34:24 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:34:24
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:34:02 +0200
Message-ID: <20210720203353.1.I550b95f6d12d59aeef5b744d837dbb360037d39e@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Andre Przywara <andre.przywara@arm.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] build: remove the variable NM in
	gen_ll_addressable_symbols.sh
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

V2l0aCBMVE8gYWN0aXZhdGVkLCB0aGUgYnVpbGRtYW4gdG9vbHMgZmFpbGVkIHdpdGggYW4gZXJy
b3Igb24gbXkKY29uZmlndXJhdGlvbiAoVWJ1bnR1IDIwLjA0LCBzdG0zMm1wMTVfdHJ1c3RlZF9k
ZWZjb25maWcpIHdpdGggdGhlIGVycm9yOgoKLi4vYXJtLWxpbnV4LWdudWVhYmkvYmluL25tOgoJ
c2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVfc3ltYm9scy5zaDogZmlsZSBmb3JtYXQgbm90IHJl
Y29nbml6ZWQKCkl0IHNlZW1zIHRoZSBzaGVsbCB2YXJpYWJsZSBpbml0aWFsaXphdGlvbiBOTT0k
KE5NKSBpcyBub3QgY29ycmVjdGx5CmludGVycHJldGVkIHdoZW4gc2hlbGwgaXMgc3RhcnRlZCBp
biB0aGUgTWFrZWZpbGUsIGJ1dCBJIGhhdmUgbm90IHRoaXMKaXNzdWUgd2hlbiBJIGNvbXBpbGUg
dGhlIHNhbWUgdGFyZ2V0IHdpdGhvdXQgYnVpbGRtYW4uCgpJIGRvbid0IGZvdW5kIHRoZSByb290
IHJlYXNvbiBvZiB0aGUgcHJvYmxlbSBidXQgSSBzb2x2ZSBpdCBieQpwcm92aWRpbmcgJChOTSkg
YXMgc2NyaXB0IHBhcmFtZXRlciBpbnN0ZWFkIHVzaW5nIGEgc2hlbGwgdmFyaWFibGUuCgpUaGUg
Y29tbWFuZCBleGVjdXRlZCBpcyBpZGVudGljYWw6CgpjbWRfa2VlcC1zeW1zLWx0by5jIDo9IE5N
PWFybS1ub25lLWxpbnV4LWdudWVhYmloZi1nY2Mtbm0gXAp1LWJvb3Qvc2NyaXB0cy9nZW5fbGxf
YWRkcmVzc2FibGVfc3ltYm9scy5zaCBhcmNoL2FybS9jcHUvYnVpbHQtaW4ubyBcCi4uLi4gbmV0
L2J1aWx0LWluLm8gPmtlZXAtc3ltcy1sdG8uYwoKY21kX2tlZXAtc3ltcy1sdG8uYyA6PSB1LWJv
b3Qvc2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVfc3ltYm9scy5zaCBcCmFybS1ub25lLWxpbnV4
LWdudWVhYmloZi1nY2Mtbm0gYXJjaC9hcm0vY3B1L2J1aWx0LWluLm8gXAouLi4gbmV0L2J1aWx0
LWluLm8gPiBrZWVwLXN5bXMtbHRvLmMKClNlcmllLWNjOiBNYXJlayBCZWjDum4gPG1hcmVrLmJl
aHVuQG5pYy5jej4KU2VyaWUtY2M6IHNqZwpTaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIERlbGF1bmF5
IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgotLS0KCiBNYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQogc2NyaXB0cy9NYWtlZmlsZS5zcGwgICAgICAgICAg
ICAgICAgICB8IDIgKy0KIHNjcmlwdHMvZ2VuX2xsX2FkZHJlc3NhYmxlX3N5bWJvbHMuc2ggfCA1
ICsrKystCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4IGNhMjQzMmM4Y2UuLjE0MGRl
YTA5ZjQgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xNzM2LDcgKzE3
MzYsNyBAQCB1LWJvb3Qta2VlcC1zeW1zLWx0b19jIDo9ICQocGF0c3Vic3QgJS5vLCUuYywkKHUt
Ym9vdC1rZWVwLXN5bXMtbHRvKSkKIAogcXVpZXRfY21kX2tlZXBfc3ltc19sdG8gPSBLU0wgICAg
ICRACiAgICAgICBjbWRfa2VlcF9zeW1zX2x0byA9IFwKLQlOTT0kKE5NKSAkKHNyY3RyZWUpL3Nj
cmlwdHMvZ2VuX2xsX2FkZHJlc3NhYmxlX3N5bWJvbHMuc2ggJF4gPiRACisJJChzcmN0cmVlKS9z
Y3JpcHRzL2dlbl9sbF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoICQoTk0pICReID4gJEAKIAogcXVp
ZXRfY21kX2tlZXBfc3ltc19sdG9fY2MgPSBLU0xDQyAgICRACiAgICAgICBjbWRfa2VlcF9zeW1z
X2x0b19jYyA9IFwKZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUuc3BsIGIvc2NyaXB0cy9N
YWtlZmlsZS5zcGwKaW5kZXggNWJlMWE5YmExYi4uMjVhM2U3ZmE1MiAxMDA2NDQKLS0tIGEvc2Ny
aXB0cy9NYWtlZmlsZS5zcGwKKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5zcGwKQEAgLTQ1OSw3ICs0
NTksNyBAQCB1LWJvb3Qtc3BsLWtlZXAtc3ltcy1sdG9fYyA6PSBcCiAKIHF1aWV0X2NtZF9rZWVw
X3N5bXNfbHRvID0gS1NMICAgICAkQAogICAgICAgY21kX2tlZXBfc3ltc19sdG8gPSBcCi0JTk09
JChOTSkgJChzcmN0cmVlKS9zY3JpcHRzL2dlbl9sbF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoICRe
ID4kQAorCSQoc3JjdHJlZSkvc2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVfc3ltYm9scy5zaCAk
KE5NKSAkXiA+ICRACiAKIHF1aWV0X2NtZF9rZWVwX3N5bXNfbHRvX2NjID0gS1NMQ0MgICAkQAog
ICAgICAgY21kX2tlZXBfc3ltc19sdG9fY2MgPSBcCmRpZmYgLS1naXQgYS9zY3JpcHRzL2dlbl9s
bF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoIGIvc2NyaXB0cy9nZW5fbGxfYWRkcmVzc2FibGVfc3lt
Ym9scy5zaAppbmRleCAzOTc4YTM5ZDk3Li5iODg0MGRkMDExIDEwMDc1NQotLS0gYS9zY3JpcHRz
L2dlbl9sbF9hZGRyZXNzYWJsZV9zeW1ib2xzLnNoCisrKyBiL3NjcmlwdHMvZ2VuX2xsX2FkZHJl
c3NhYmxlX3N5bWJvbHMuc2gKQEAgLTUsOCArNSwxMSBAQAogIyBHZW5lcmF0ZSBfX0FERFJFU1NB
QkxFKHN5bWJvbCkgZm9yIGV2ZXJ5IGxpbmtlciBsaXN0IGVudHJ5IHN5bWJvbCwgc28gdGhhdCBM
VE8KICMgZG9lcyBub3Qgb3B0aW1pemUgdGhlc2Ugc3ltYm9scyBhd2F5CiAKKyMgVGhlIGV4cGVj
dGVkIHBhcmFtZXRlciBvZiB0aGlzIHNjcmlwdCBpcyB0aGUgY29tbWFuZCByZXF1ZXN0ZWQgdG8g
aGF2ZQorIyB0aGUgVS1Cb290IHN5bWJvbHMgdG8gcGFyc2UsIGZvciBleGFtcGxlOiAkKE5NKSAk
KHUtYm9vdC1tYWluKQorCiBzZXQgLWUKIAogZWNobyAnI2luY2x1ZGUgPGNvbW1vbi5oPicKLSRO
TSAiJEAiIDI+L2Rldi9udWxsIHwgZ3JlcCAtb2UgJ191X2Jvb3RfbGlzdF8yX1thLXpBLVowLTlf
XSpfMl9bYS16QS1aMC05X10qJyB8IFwKKyRAIDI+L2Rldi9udWxsIHwgZ3JlcCAtb2UgJ191X2Jv
b3RfbGlzdF8yX1thLXpBLVowLTlfXSpfMl9bYS16QS1aMC05X10qJyB8IFwKIAlzb3J0IC11IHwg
c2VkIC1lICdzL15cKC4qXCkvZXh0ZXJuIGNoYXIgXDFbXTtcbl9fQUREUkVTU0FCTEUoXDEpOy8n
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
