Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2684EBBCC
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Mar 2022 09:34:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CB74C60467;
	Wed, 30 Mar 2022 07:34:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3648AC60465
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 07:34:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22U2p7Ig029081;
 Wed, 30 Mar 2022 09:33:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=RN0MOH+cJPToBcj7yxyalpE/OmRUKPg9MWFQX/pb/vU=;
 b=bpTos0x5VOOj2sxAWF0OxkqLbuFPsgHNAI4qjqf0CKdjLIssvv/vxeuIH11g/yCh6GAH
 3D/4MdfBnSHsiR/M/fw8I1uoVSQArV/p07JHfvuwBqPSifWK0UYyKHsSstz4Wl0DmR7w
 zqF+91K5XgOHWn6Avhl9dXQjTeODLDwHjlHV95A0CYJhPLCSq74lu3+R6Cig6pOuSKHD
 aAzopfQEXksss2eEdRzDvASfwgky0wXUAioKTE3JruuGEzmGwsEpCxR+eUBKd9c57FPH
 m9yPC2Orr2yV3aW5KuUTCMNRMx43zTC3/g07VpbWLt7VnSlzvPROz0hRX4bclJzROx25 yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1rudftap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 09:33:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA4AA100034;
 Wed, 30 Mar 2022 09:33:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DF0AC2128CB;
 Wed, 30 Mar 2022 09:33:26 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 30 Mar
 2022 09:33:26 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 30 Mar 2022 09:33:13 +0200
Message-ID: <20220330073315.7703-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220330073315.7703-1-patrice.chotard@foss.st.com>
References: <20220330073315.7703-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_02,2022-03-29_01,2022-02-23_01
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
Subject: [Uboot-stm32] [PATCH v4 1/3] spi: spi-uclass: Add new
	spi_get_bus_and_cs() implementation
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

TW92ZSBsZWdhY3kgc3BpX2dldF9idXNfYW5kX2NzKCkgY29kZSB0byBfc3BpX2dldF9idXNfYW5k
X2NzKCkuCgpBZGQgbmV3IHNwaV9nZXRfYnVzX2FuZF9jcygpIGltcGxlbWVudGF0aW9uIHdoaWNo
IHJlbHkgb24gRFQKZm9yIHNwZWVkIGFuZCBtb2RlIGFuZCBkb24ndCBuZWVkIGFueSBkcnZfbmFt
ZSBub3IgZGV2X25hbWUKcGFyYW1ldGVycy4gVGhpcyB3aWxsIHByZXBhcmUgdGhlIGdyb3VuZCBm
b3IgbmV4dCBwYXRjaC4KClVwZGF0ZSBhbGwgY2FsbGVycyB0byB1c2UgX3NwaV9nZXRfYnVzX2Fu
ZF9jcygpIHRvIGtlZXAgdGhlCnNhbWUgYmVoYXZpb3IuCgpTaWduZWQtb2ZmLWJ5OiBQYXRyaWNl
IENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KCkNjOiBNYXJlayBCZWh1biA8
bWFyZWsuYmVodW5AbmljLmN6PgpDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9u
cy5jb20+CkNjOiBWaWduZXNoIFIgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IEpvZSBIZXJzaGJlcmdl
ciA8am9lLmhlcnNoYmVyZ2VyQG5pLmNvbT4KQ2M6IFJhbW9uIEZyaWVkIDxyZnJpZWQuZGV2QGdt
YWlsLmNvbT4KQ2M6IEx1a2FzeiBNYWpld3NraSA8bHVrbWFAZGVueC5kZT4KQ2M6IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPgpDYzogV29sZmdhbmcgRGVuayA8d2RAZGVueC5kZT4KQ2M6IFNp
bW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgpDYzogU3RlZmFuIFJvZXNlIDxzckBkZW54LmRl
PgpDYzogIlBhbGkgUm9ow6FyIiA8cGFsaUBrZXJuZWwub3JnPgpDYzogS29uc3RhbnRpbiBQb3Jv
dGNoa2luIDxrb3N0YXBAbWFydmVsbC5jb20+CkNjOiBJZ2FsIExpYmVybWFuIDxpZ2FsbEBtYXJ2
ZWxsLmNvbT4KQ2M6IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+CkNjOiBQcmF0eXVzaCBZ
YWRhdiA8cC55YWRhdkB0aS5jb20+CkNjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNv
bT4KQ2M6IEFuamkgSiA8YW5qaS5qYWdhcmxtdWRpQG54cC5jb20+CkNjOiBCaXdlbiBMaSA8Yml3
ZW4ubGlAbnhwLmNvbT4KQ2M6IFByaXlhbmthIEphaW4gPHByaXlhbmthLmphaW5AbnhwLmNvbT4K
Q2M6IENoYWl0YW55YSBTYWtpbmFtIDxjaGFpdGFueWEuc2FraW5hbUBueHAuY29tPgotLS0KCihu
byBjaGFuZ2VzIHNpbmNlIHYxKQoKIGJvYXJkL0NaLk5JQy90dXJyaXNfbW94L3R1cnJpc19tb3gu
YyB8ICA2ICstLQogY21kL3NwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0K
IGRyaXZlcnMvbXRkL3NwaS9zZi11Y2xhc3MuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3Nw
aS9zcGktdWNsYXNzLmMgICAgICAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysr
LS0tCiBkcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuYyAgICAgfCAgNCArLQogaW5jbHVk
ZS9zcGkuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKy0KIHRlc3QvZG0vc3Bp
LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDMzICsrKysrKystLS0tLS0tCiA3IGZpbGVzIGNo
YW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9i
b2FyZC9DWi5OSUMvdHVycmlzX21veC90dXJyaXNfbW94LmMgYi9ib2FyZC9DWi5OSUMvdHVycmlz
X21veC90dXJyaXNfbW94LmMKaW5kZXggODg4OGEyZGNhYi4uODEyY2Y3ZDhlMyAxMDA2NDQKLS0t
IGEvYm9hcmQvQ1ouTklDL3R1cnJpc19tb3gvdHVycmlzX21veC5jCisrKyBiL2JvYXJkL0NaLk5J
Qy90dXJyaXNfbW94L3R1cnJpc19tb3guYwpAQCAtMTQ4LDkgKzE0OCw5IEBAIHN0YXRpYyBpbnQg
bW94X2RvX3NwaSh1OCAqaW4sIHU4ICpvdXQsIHNpemVfdCBzaXplKQogCXN0cnVjdCB1ZGV2aWNl
ICpkZXY7CiAJaW50IHJldDsKIAotCXJldCA9IHNwaV9nZXRfYnVzX2FuZF9jcygwLCAxLCAxMDAw
MDAwLCBTUElfQ1BIQSB8IFNQSV9DUE9MLAotCQkJCSAic3BpX2dlbmVyaWNfZHJ2IiwgIm1veHRl
dEAxIiwgJmRldiwKLQkJCQkgJnNsYXZlKTsKKwlyZXQgPSBfc3BpX2dldF9idXNfYW5kX2NzKDAs
IDEsIDEwMDAwMDAsIFNQSV9DUEhBIHwgU1BJX0NQT0wsCisJCQkJICAic3BpX2dlbmVyaWNfZHJ2
IiwgIm1veHRldEAxIiwgJmRldiwKKwkJCQkgICZzbGF2ZSk7CiAJaWYgKHJldCkKIAkJZ290byBm
YWlsOwogCmRpZmYgLS1naXQgYS9jbWQvc3BpLmMgYi9jbWQvc3BpLmMKaW5kZXggNmRjMzI2Nzhk
YS4uNDU0ZWJlMzdkNyAxMDA2NDQKLS0tIGEvY21kL3NwaS5jCisrKyBiL2NtZC9zcGkuYwpAQCAt
NDYsOCArNDYsOCBAQCBzdGF0aWMgaW50IGRvX3NwaV94ZmVyKGludCBidXMsIGludCBjcykKIAlz
dHIgPSBzdHJkdXAobmFtZSk7CiAJaWYgKCFzdHIpCiAJCXJldHVybiAtRU5PTUVNOwotCXJldCA9
IHNwaV9nZXRfYnVzX2FuZF9jcyhidXMsIGNzLCBmcmVxLCBtb2RlLCAic3BpX2dlbmVyaWNfZHJ2
IiwKLQkJCQkgc3RyLCAmZGV2LCAmc2xhdmUpOworCXJldCA9IF9zcGlfZ2V0X2J1c19hbmRfY3Mo
YnVzLCBjcywgZnJlcSwgbW9kZSwgInNwaV9nZW5lcmljX2RydiIsCisJCQkJICBzdHIsICZkZXYs
ICZzbGF2ZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKICNlbHNlCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGkvc2YtdWNsYXNzLmMgYi9kcml2ZXJzL210ZC9zcGkvc2YtdWNsYXNzLmMK
aW5kZXggNjNkMTYyOTFmZi4uYjQ1YmE1NGViZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3Bp
L3NmLXVjbGFzcy5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS9zZi11Y2xhc3MuYwpAQCAtNzQsNyAr
NzQsNyBAQCBpbnQgc3BpX2ZsYXNoX3Byb2JlX2J1c19jcyh1bnNpZ25lZCBpbnQgYnVzbnVtLCB1
bnNpZ25lZCBpbnQgY3MsCiAJc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAic3BpX2ZsYXNo
QCVkOiVkIiwgYnVzbnVtLCBjcyk7CiAJc3RyID0gc3RyZHVwKG5hbWUpOwogI2VuZGlmCi0JcmV0
ID0gc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIG1heF9oeiwgc3BpX21vZGUsCisJcmV0
ID0gX3NwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzLCBtYXhfaHosIHNwaV9tb2RlLAogCQkJ
CSAgImplZGVjX3NwaV9ub3IiLCBzdHIsICZidXMsICZzbGF2ZSk7CiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS11Y2xhc3MuYyBiL2RyaXZlcnMv
c3BpL3NwaS11Y2xhc3MuYwppbmRleCBmOGVjMzEyZDcxLi5mMjc5MWM0Yjg4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3NwaS9zcGktdWNsYXNzLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXVjbGFzcy5j
CkBAIC0zNDAsOSArMzQwLDY1IEBAIGludCBzcGlfZmluZF9idXNfYW5kX2NzKGludCBidXNudW0s
IGludCBjcywgc3RydWN0IHVkZXZpY2UgKipidXNwLAogCXJldHVybiByZXQ7CiB9CiAKLWludCBz
cGlfZ2V0X2J1c19hbmRfY3MoaW50IGJ1c251bSwgaW50IGNzLCBpbnQgc3BlZWQsIGludCBtb2Rl
LAotCQkgICAgICAgY29uc3QgY2hhciAqZHJ2X25hbWUsIGNvbnN0IGNoYXIgKmRldl9uYW1lLAot
CQkgICAgICAgc3RydWN0IHVkZXZpY2UgKipidXNwLCBzdHJ1Y3Qgc3BpX3NsYXZlICoqZGV2cCkK
K2ludCBzcGlfZ2V0X2J1c19hbmRfY3MoaW50IGJ1c251bSwgaW50IGNzLCBzdHJ1Y3QgdWRldmlj
ZSAqKmJ1c3AsCisJCSAgICAgICBzdHJ1Y3Qgc3BpX3NsYXZlICoqZGV2cCkKK3sKKwlzdHJ1Y3Qg
dWRldmljZSAqYnVzLCAqZGV2OworCXN0cnVjdCBkbV9zcGlfYnVzICpidXNfZGF0YTsKKwlzdHJ1
Y3Qgc3BpX3NsYXZlICpzbGF2ZTsKKwlpbnQgcmV0OworCisjaWYgQ09ORklHX0lTX0VOQUJMRUQo
T0ZfUExBVERBVEEpCisJcmV0ID0gdWNsYXNzX2ZpcnN0X2RldmljZV9lcnIoVUNMQVNTX1NQSSwg
JmJ1cyk7CisjZWxzZQorCXJldCA9IHVjbGFzc19nZXRfZGV2aWNlX2J5X3NlcShVQ0xBU1NfU1BJ
LCBidXNudW0sICZidXMpOworI2VuZGlmCisJaWYgKHJldCkgeworCQlsb2dfZXJyKCJJbnZhbGlk
IGJ1cyAlZCAoZXJyPSVkKVxuIiwgYnVzbnVtLCByZXQpOworCQlyZXR1cm4gcmV0OworCX0KKwly
ZXQgPSBzcGlfZmluZF9jaGlwX3NlbGVjdChidXMsIGNzLCAmZGV2KTsKKwlpZiAocmV0KSB7CisJ
CWRldl9lcnIoYnVzLCAiSW52YWxpZCBjaGlwIHNlbGVjdCAlZDolZCAoZXJyPSVkKVxuIiwgYnVz
bnVtLCBjcywgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwlpZiAoIWRldmljZV9hY3RpdmUo
ZGV2KSkgeworCQlzdHJ1Y3Qgc3BpX3NsYXZlICpzbGF2ZTsKKworCQlyZXQgPSBkZXZpY2VfcHJv
YmUoZGV2KTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyOworCQlzbGF2ZSA9IGRldl9nZXRfcGFy
ZW50X3ByaXYoZGV2KTsKKwkJc2xhdmUtPmRldiA9IGRldjsKKwl9CisKKwlzbGF2ZSA9IGRldl9n
ZXRfcGFyZW50X3ByaXYoZGV2KTsKKwlidXNfZGF0YSA9IGRldl9nZXRfdWNsYXNzX3ByaXYoYnVz
KTsKKworCS8qCisJICogSW4gY2FzZSB0aGUgb3BlcmF0aW9uIHNwZWVkIGlzIG5vdCB5ZXQgZXN0
YWJsaXNoZWQgYnkKKwkgKiBkbV9zcGlfY2xhaW1fYnVzKCkgZW5zdXJlIHRoZSBidXMgaXMgY29u
ZmlndXJlZCBwcm9wZXJseS4KKwkgKi8KKwlpZiAoIWJ1c19kYXRhLT5zcGVlZCkgeworCQlyZXQg
PSBzcGlfY2xhaW1fYnVzKHNsYXZlKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyOworCX0KKwkq
YnVzcCA9IGJ1czsKKwkqZGV2cCA9IHNsYXZlOworCisJcmV0dXJuIDA7CisKK2VycjoKKwlsb2df
ZGVidWcoIiVzOiBFcnJvciBwYXRoLCBkZXZpY2UgJyVzJ1xuIiwgX19mdW5jX18sIGRldi0+bmFt
ZSk7CisKKwlyZXR1cm4gcmV0OworfQorCitpbnQgX3NwaV9nZXRfYnVzX2FuZF9jcyhpbnQgYnVz
bnVtLCBpbnQgY3MsIGludCBzcGVlZCwgaW50IG1vZGUsCisJCQljb25zdCBjaGFyICpkcnZfbmFt
ZSwgY29uc3QgY2hhciAqZGV2X25hbWUsCisJCQlzdHJ1Y3QgdWRldmljZSAqKmJ1c3AsIHN0cnVj
dCBzcGlfc2xhdmUgKipkZXZwKQogewogCXN0cnVjdCB1ZGV2aWNlICpidXMsICpkZXY7CiAJc3Ry
dWN0IGRtX3NwaV9zbGF2ZV9wbGF0ICpwbGF0OwpAQCAtNDUzLDggKzUwOSw4IEBAIHN0cnVjdCBz
cGlfc2xhdmUgKnNwaV9zZXR1cF9zbGF2ZSh1bnNpZ25lZCBpbnQgYnVzbnVtLCB1bnNpZ25lZCBp
bnQgY3MsCiAJc3RydWN0IHVkZXZpY2UgKmRldjsKIAlpbnQgcmV0OwogCi0JcmV0ID0gc3BpX2dl
dF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLCBOVUxMLCAwLCAmZGV2LAotCQkJ
CSAmc2xhdmUpOworCXJldCA9IF9zcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgc3BlZWQs
IG1vZGUsIE5VTEwsIDAsICZkZXYsCisJCQkJICAmc2xhdmUpOwogCWlmIChyZXQpCiAJCXJldHVy
biBOVUxMOwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuYyBi
L2RyaXZlcnMvdXNiL2dhZGdldC9tYXgzNDIwX3VkYy5jCmluZGV4IGExNjA5NWY4OTIuLmZhNjU1
Yzk4ZGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC9tYXgzNDIwX3VkYy5jCisrKyBi
L2RyaXZlcnMvdXNiL2dhZGdldC9tYXgzNDIwX3VkYy5jCkBAIC04MzAsOCArODMwLDggQEAgc3Rh
dGljIGludCBtYXgzNDIwX3VkY19wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQogCWNzID0gc2xh
dmVfcGRhdGEtPmNzOwogCXNwZWVkID0gc2xhdmVfcGRhdGEtPm1heF9oejsKIAltb2RlID0gc2xh
dmVfcGRhdGEtPm1vZGU7Ci0Jc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBt
b2RlLCAic3BpX2dlbmVyaWNfZHJ2IiwKLQkJCSAgIE5VTEwsICZzcGlkLCAmdWRjLT5zbGF2ZSk7
CisJX3NwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzLCBzcGVlZCwgbW9kZSwgZmFsc2UsICJz
cGlfZ2VuZXJpY19kcnYiLAorCQkJICAgIE5VTEwsICZzcGlkLCAmdWRjLT5zbGF2ZSk7CiAKIAl1
ZGMtPmRldiA9IGRldjsKIAl1ZGMtPmdhZGdldC5lcDAgPSAmdWRjLT5lcFswXS5lcF91c2I7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NwaS5oIGIvaW5jbHVkZS9zcGkuaAppbmRleCBmYTlhYjEyZGJl
Li45YThjMWZiMjYwIDEwMDY0NAotLS0gYS9pbmNsdWRlL3NwaS5oCisrKyBiL2luY2x1ZGUvc3Bp
LmgKQEAgLTU3Miw2ICs1NzIsMjMgQEAgaW50IHNwaV9maW5kX2J1c19hbmRfY3MoaW50IGJ1c251
bSwgaW50IGNzLCBzdHJ1Y3QgdWRldmljZSAqKmJ1c3AsCiAgKiBHaXZlbiBhIGJ1cyBudW1iZXIg
YW5kIGNoaXAgc2VsZWN0LCB0aGlzIGZpbmRzIHRoZSBjb3JyZXNwb25kaW5nIGJ1cwogICogZGV2
aWNlIGFuZCBzbGF2ZSBkZXZpY2UuCiAgKgorICogQGJ1c251bToJU1BJIGJ1cyBudW1iZXIKKyAq
IEBjczoJCUNoaXAgc2VsZWN0IHRvIGxvb2sgZm9yCisgKiBAYnVzcDoJUmV0dXJucyBidXMgZGV2
aWNlCisgKiBAZGV2cDoJUmV0dXJuIHNsYXZlIGRldmljZQorICogQHJldHVybiAwIGlmIGZvdW5k
LCAtdmUgb24gZXJyb3IKKyAqLworaW50IHNwaV9nZXRfYnVzX2FuZF9jcyhpbnQgYnVzbnVtLCBp
bnQgY3MsCisJCSAgICAgICBzdHJ1Y3QgdWRldmljZSAqKmJ1c3AsIHN0cnVjdCBzcGlfc2xhdmUg
KipkZXZwKTsKKworLyoqCisgKiBfc3BpX2dldF9idXNfYW5kX2NzKCkgLSBGaW5kIGFuZCBhY3Rp
dmF0ZSBidXMgYW5kIHNsYXZlIGRldmljZXMgYnkgbnVtYmVyCisgKiBBcyBzcGlfZmxhc2hfcHJv
YmUoKSwgVGhpcyBpcyBhbiBvbGQtc3R5bGUgZnVuY3Rpb24uIFdlIHNob3VsZCByZW1vdmUKKyAq
IGl0IHdoZW4gYWxsIFNQSSBmbGFzaCBkcml2ZXJzIHVzZSBkbQorICoKKyAqIEdpdmVuIGEgYnVz
IG51bWJlciBhbmQgY2hpcCBzZWxlY3QsIHRoaXMgZmluZHMgdGhlIGNvcnJlc3BvbmRpbmcgYnVz
CisgKiBkZXZpY2UgYW5kIHNsYXZlIGRldmljZS4KKyAqCiAgKiBJZiBubyBzdWNoIHNsYXZlIGV4
aXN0cywgYW5kIGRydl9uYW1lIGlzIG5vdCBOVUxMLCB0aGVuIGEgbmV3IHNsYXZlIGRldmljZQog
ICogaXMgYXV0b21hdGljYWxseSBib3VuZCBvbiB0aGlzIGNoaXAgc2VsZWN0IHdpdGggcmVxdWVz
dGVkIHNwZWVkIGFuZCBtb2RlLgogICoKQEAgLTU4OCw3ICs2MDUsNyBAQCBpbnQgc3BpX2ZpbmRf
YnVzX2FuZF9jcyhpbnQgYnVzbnVtLCBpbnQgY3MsIHN0cnVjdCB1ZGV2aWNlICoqYnVzcCwKICAq
IEBkZXZwOglSZXR1cm4gc2xhdmUgZGV2aWNlCiAgKiBSZXR1cm46IDAgaWYgZm91bmQsIC12ZSBv
biBlcnJvcgogICovCi1pbnQgc3BpX2dldF9idXNfYW5kX2NzKGludCBidXNudW0sIGludCBjcywg
aW50IHNwZWVkLCBpbnQgbW9kZSwKK2ludCBfc3BpX2dldF9idXNfYW5kX2NzKGludCBidXNudW0s
IGludCBjcywgaW50IHNwZWVkLCBpbnQgbW9kZSwKIAkJCWNvbnN0IGNoYXIgKmRydl9uYW1lLCBj
b25zdCBjaGFyICpkZXZfbmFtZSwKIAkJCXN0cnVjdCB1ZGV2aWNlICoqYnVzcCwgc3RydWN0IHNw
aV9zbGF2ZSAqKmRldnApOwogCmRpZmYgLS1naXQgYS90ZXN0L2RtL3NwaS5jIGIvdGVzdC9kbS9z
cGkuYwppbmRleCBlZTRhZDNhYmFhLi43YWIwODIwYWJiIDEwMDY0NAotLS0gYS90ZXN0L2RtL3Nw
aS5jCisrKyBiL3Rlc3QvZG0vc3BpLmMKQEAgLTQ2LDE5ICs0NiwxOSBAQCBzdGF0aWMgaW50IGRt
X3Rlc3Rfc3BpX2ZpbmQoc3RydWN0IHVuaXRfdGVzdF9zdGF0ZSAqdXRzKQogCiAJLyogVGhpcyBm
aW5kcyBub3RoaW5nIGJlY2F1c2Ugd2UgcmVtb3ZlZCB0aGUgZGV2aWNlICovCiAJdXRfYXNzZXJ0
ZXEoLUVOT0RFViwgc3BpX2ZpbmRfYnVzX2FuZF9jcyhidXNudW0sIGNzLCAmYnVzLCAmZGV2KSk7
Ci0JdXRfYXNzZXJ0ZXEoLUVOT0RFViwgc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNw
ZWVkLCBtb2RlLAotCQkJCQkJTlVMTCwgMCwgJmJ1cywgJnNsYXZlKSk7CisJdXRfYXNzZXJ0ZXEo
LUVOT0RFViwgX3NwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzLCBzcGVlZCwgbW9kZSwKKwkJ
CQkJCSBOVUxMLCAwLCAmYnVzLCAmc2xhdmUpKTsKIAogCS8qCiAJICogVGhpcyBmb3JjZXMgdGhl
IGRldmljZSB0byBiZSByZS1hZGRlZCwgYnV0IHRoZXJlIGlzIG5vIGVtdWxhdGlvbgogCSAqIGNv
bm5lY3RlZCBzbyB0aGUgcHJvYmUgd2lsbCBmYWlsLiBXZSByZXF1aXJlIHRoYXQgYnVzIGlzIGxl
ZnQKLQkgKiBhbG9uZSBvbiBmYWlsdXJlLCBhbmQgdGhhdCB0aGUgc3BpX2dldF9idXNfYW5kX2Nz
KCkgZG9lcyBub3QgYWRkCisJICogYWxvbmUgb24gZmFpbHVyZSwgYW5kIHRoYXQgdGhlIF9zcGlf
Z2V0X2J1c19hbmRfY3MoKSBkb2VzIG5vdCBhZGQKIAkgKiBhICdwYXJ0aWFsbHktaW5pdGVkJyBk
ZXZpY2UuCiAJICovCiAJdXRfYXNzZXJ0ZXEoLUVOT0RFViwgc3BpX2ZpbmRfYnVzX2FuZF9jcyhi
dXNudW0sIGNzLCAmYnVzLCAmZGV2KSk7Ci0JdXRfYXNzZXJ0ZXEoLUVOT0VOVCwgc3BpX2dldF9i
dXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLAotCQkJCQkJImplZGVjX3NwaV9ub3Ii
LCAibmFtZSIsICZidXMsCi0JCQkJCQkmc2xhdmUpKTsKKwl1dF9hc3NlcnRlcSgtRU5PRU5ULCBf
c3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLAorCQkJCQkJICJqZWRl
Y19zcGlfbm9yIiwgIm5hbWUiLCAmYnVzLAorCQkJCQkJICZzbGF2ZSkpOwogCXNhbmRib3hfc2Zf
dW5iaW5kX2VtdWwoc3RhdGVfZ2V0X2N1cnJlbnQoKSwgYnVzbnVtLCBjcyk7CiAJdXRfYXNzZXJ0
b2soc3BpX2NzX2luZm8oYnVzLCBjcywgJmluZm8pKTsKIAl1dF9hc3NlcnRlcV9wdHIoTlVMTCwg
aW5mby5kZXYpOwpAQCAtNjcsOCArNjcsOCBAQCBzdGF0aWMgaW50IGRtX3Rlc3Rfc3BpX2ZpbmQo
c3RydWN0IHVuaXRfdGVzdF9zdGF0ZSAqdXRzKQogCXV0X2Fzc2VydG9rKHNhbmRib3hfc2ZfYmlu
ZF9lbXVsKHN0YXRlLCBidXNudW0sIGNzLCBidXMsIG5vZGUsCiAJCQkJCSAibmFtZSIpKTsKIAl1
dF9hc3NlcnRvayhzcGlfZmluZF9idXNfYW5kX2NzKGJ1c251bSwgY3MsICZidXMsICZkZXYpKTsK
LQl1dF9hc3NlcnRvayhzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgc3BlZWQsIG1vZGUs
Ci0JCQkJICAgICAgICJqZWRlY19zcGlfbm9yIiwgIm5hbWUiLCAmYnVzLCAmc2xhdmUpKTsKKwl1
dF9hc3NlcnRvayhfc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLAor
CQkJCQkiamVkZWNfc3BpX25vciIsICJuYW1lIiwgJmJ1cywgJnNsYXZlKSk7CiAKIAl1dF9hc3Nl
cnRvayhzcGlfY3NfaW5mbyhidXMsIGNzLCAmaW5mbykpOwogCXV0X2Fzc2VydGVxX3B0cihpbmZv
LmRldiwgc2xhdmUtPmRldik7CkBAIC03Niw4ICs3Niw5IEBAIHN0YXRpYyBpbnQgZG1fdGVzdF9z
cGlfZmluZChzdHJ1Y3QgdW5pdF90ZXN0X3N0YXRlICp1dHMpCiAJLyogV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gYWRkIHNvbWV0aGluZyB0byBhbm90aGVyIGNoaXAgc2VsZWN0ICovCiAJdXRfYXNzZXJ0
b2soc2FuZGJveF9zZl9iaW5kX2VtdWwoc3RhdGUsIGJ1c251bSwgY3NfYiwgYnVzLCBub2RlLAog
CQkJCQkgIm5hbWUiKSk7Ci0JdXRfYXNzZXJ0ZXEoLUVJTlZBTCwgc3BpX2dldF9idXNfYW5kX2Nz
KGJ1c251bSwgY3NfYiwgc3BlZWQsIG1vZGUsCi0JCQkJICAgICAgICJqZWRlY19zcGlfbm9yIiwg
Im5hbWUiLCAmYnVzLCAmc2xhdmUpKTsKKwl1dF9hc3NlcnRlcSgtRUlOVkFMLCBfc3BpX2dldF9i
dXNfYW5kX2NzKGJ1c251bSwgY3NfYiwgc3BlZWQsIG1vZGUsCisJCQkJCQkgImplZGVjX3NwaV9u
b3IiLCAibmFtZSIsICZidXMsCisJCQkJCQkgJnNsYXZlKSk7CiAJdXRfYXNzZXJ0ZXEoLUVJTlZB
TCwgc3BpX2NzX2luZm8oYnVzLCBjc19iLCAmaW5mbykpOwogCXV0X2Fzc2VydGVxX3B0cihOVUxM
LCBpbmZvLmRldik7CiAKQEAgLTE0NSwxMSArMTQ2LDExIEBAIHN0YXRpYyBpbnQgZG1fdGVzdF9z
cGlfY2xhaW1fYnVzKHN0cnVjdCB1bml0X3Rlc3Rfc3RhdGUgKnV0cykKIAljb25zdCBpbnQgYnVz
bnVtID0gMCwgY3NfYSA9IDAsIGNzX2IgPSAxLCBtb2RlID0gMDsKIAogCS8qIEdldCBzcGkgc2xh
dmUgb24gQ1MwICovCi0JdXRfYXNzZXJ0b2soc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Nf
YSwgMTAwMDAwMCwgbW9kZSwgTlVMTCwgMCwKLQkJCQkgICAgICAgJmJ1cywgJnNsYXZlX2EpKTsK
Kwl1dF9hc3NlcnRvayhfc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3NfYSwgMTAwMDAwMCwg
bW9kZSwgTlVMTCwgMCwKKwkJCQkJJmJ1cywgJnNsYXZlX2EpKTsKIAkvKiBHZXQgc3BpIHNsYXZl
IG9uIENTMSAqLwotCXV0X2Fzc2VydG9rKHNwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzX2Is
IDEwMDAwMDAsIG1vZGUsIE5VTEwsIDAsCi0JCQkJICAgICAgICZidXMsICZzbGF2ZV9iKSk7CisJ
dXRfYXNzZXJ0b2soX3NwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzX2IsIDEwMDAwMDAsIG1v
ZGUsIE5VTEwsIDAsCisJCQkJCSZidXMsICZzbGF2ZV9iKSk7CiAKIAkvKiBEaWZmZXJlbnQgbWF4
X2h6LCBkaWZmZXJlbnQgbW9kZS4gKi8KIAl1dF9hc3NlcnQoc2xhdmVfYS0+bWF4X2h6ICE9IHNs
YXZlX2ItPm1heF9oeik7CkBAIC0xODIsOCArMTgzLDggQEAgc3RhdGljIGludCBkbV90ZXN0X3Nw
aV94ZmVyKHN0cnVjdCB1bml0X3Rlc3Rfc3RhdGUgKnV0cykKIAljb25zdCBjaGFyIGRvdXRbNV0g
PSB7MHg5Zn07CiAJdW5zaWduZWQgY2hhciBkaW5bNV07CiAKLQl1dF9hc3NlcnRvayhzcGlfZ2V0
X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgMTAwMDAwMCwgbW9kZSwgTlVMTCwgMCwKLQkJCQkgICAg
ICAgJmJ1cywgJnNsYXZlKSk7CisJdXRfYXNzZXJ0b2soX3NwaV9nZXRfYnVzX2FuZF9jcyhidXNu
dW0sIGNzLCAxMDAwMDAwLCBtb2RlLCBOVUxMLCAwLAorCQkJCQkmYnVzLCAmc2xhdmUpKTsKIAl1
dF9hc3NlcnRvayhzcGlfY2xhaW1fYnVzKHNsYXZlKSk7CiAJdXRfYXNzZXJ0b2soc3BpX3hmZXIo
c2xhdmUsIDQwLCBkb3V0LCBkaW4sCiAJCQkgICAgIFNQSV9YRkVSX0JFR0lOIHwgU1BJX1hGRVJf
RU5EKSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
