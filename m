Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB89F48C2AB
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Jan 2022 11:59:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F94DC5F1F4;
	Wed, 12 Jan 2022 10:59:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A5EBC5C82A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 10:59:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20C7JMWp019527;
 Wed, 12 Jan 2022 11:59:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=2BPcAOQTLTVb32DJxQIE4cHAARFBlGcaqHnPF0qAPdY=;
 b=1zVlkYYcxPOGCh2XgFS8rj9iU596/JgignkoG2yBo3k0eCetWT+zZg/C5QtH10M8Axgz
 wyjmrju2p5puIL3RXg3duLdQDStF1lsYjx6NzkyDExnwe3SSmiM9Ia0Rw+dJHG1Mb+Wm
 Jfae33UGbDe6S9mGO5FLK/TA75vTgOGT5Hm/Nl4n1uNkJVW8vrsgT54SoXjyyDQb8WyK
 qYWGOZ7fV+ZhMXZ/GLam16lryzkZyYDFnZSgv3txWjZcHbxVskFfodftBI8WZY13Yc2l
 eLwAzyxrR7hzDu7TXtYZv3yFx5lNDPmYl7ugDB6zgUEbGEA/RYeU2amJ2C+ptfbRC4GG Vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dhtg9sfjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:59:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B1EF710002A;
 Wed, 12 Jan 2022 11:59:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA7FE221774;
 Wed, 12 Jan 2022 11:59:12 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 12 Jan 2022 11:59:12
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Jan 2022 11:59:08 +0100
Message-ID: <20220112105908.7388-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_03,2022-01-11_01,2021-12-02_01
Cc: Vignesh R <vigneshr@ti.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Sean Anderson <seanga2@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>,
 Chaitanya Sakinam <chaitanya.sakinam@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Vasut <marex@denx.de>,
 Lukasz Majewski <lukma@denx.de>, Marek Behun <marek.behun@nic.cz>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Konstantin Porotchkin <kostap@marvell.com>, Biwen Li <biwen.li@nxp.com>,
 Wolfgang Denk <wd@denx.de>, Anji J <anji.jagarlmudi@nxp.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Igal Liberman <igall@marvell.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Pratyush Yadav <p.yadav@ti.com>
Subject: [Uboot-stm32] [PATCH] spi: Add spi_get_bus_and_cs() new use_dt param
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

QWRkIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSBhbmQgc3BpX2dldF9idXNfYW5kX2NzKCkgbmV3
ICJ1c2VfZHQiCnBhcmFtIHdoaWNoIGFsbG93cyB0byBzZWxlY3QgU1BJIHNwZWVkIGFuZCBtb2Rl
IGZyb20gRFQgb3IgZnJvbQpkZWZhdWx0IHZhbHVlIHBhc3NlZCBpbiBwYXJhbWV0ZXJzLgoKU2lu
Y2UgY29tbWl0IGUyZTk1ZTVlMjU0MiAoInNwaTogVXBkYXRlIHNwZWVkL21vZGUgb24gY2hhbmdl
IikKd2hlbiBjYWxsaW5nICJzZiBwcm9iZSIgb3IgImVudiBzYXZlIiBvbiBTUEkgZmxhc2gsCnNw
aV9zZXRfc3BlZWRfbW9kZSgpIGlzIGNhbGxlZCB0d2ljZS4KCnNwaV9nZXRfYnVzX2FuZF9jcygp
CiAgICAgIHwtLT4gc3BpX2NsYWltX2J1cygpCiAgICAgIHwgICAgICAgfC0tPiBzcGlfc2V0X3Nw
ZWVkX21vZGUoc3BlZWQgYW5kIG1vZGUgZnJvbSBEVCkKICAgICAgLi4uCiAgICAgIHwtLT4gc3Bp
X3NldF9zcGVlZF9tb2RlKGRlZmF1bHQgc3BlZWQgYW5kIG1vZGUgdmFsdWUpCgpUaGUgZmlyc3Qg
c3BpX3NldF9zcGVlZF9tb2RlKCkgY2FsbCBpcyBkb25lIHdpdGggc3BlZWQgYW5kIG1vZGUKdmFs
dWVzIGZyb20gRFQsIHdoZXJlYXMgdGhlIHNlY29uZCBjYWxsIGlzIGRvbmUgd2l0aCBzcGVlZAph
bmQgbW9kZSBzZXQgdG8gZGVmYXVsdCB2YWx1ZSAoc3BlZWQgaXMgc2V0IHRvIENPTkZJR19TRl9E
RUZBVUxUX1NQRUVEKQoKVGhpcyBpcyBhbiBpc3N1ZSBiZWNhdXNlIFNQSSBmbGFzaCBwZXJmb3Jt
YW5jZSBhcmUgaW1wYWN0ZWQgYnkKdXNpbmcgZGVmYXVsdCBzcGVlZCB3aGljaCBjYW4gYmUgbG93
ZXIgdGhhbiB0aGUgb25lIGRlZmluZWQgaW4gRFQuCgpPbmUgc29sdXRpb24gaXMgdG8gc2V0IENP
TkZJR19TRl9ERUZBVUxUX1NQRUVEIHRvIHRoZSBzcGVlZCBkZWZpbmVkCmluIERULCBidXQgd2Ug
bG9vc2UgZmxleGliaWxpdHkgb2ZmZXJlZCBieSBEVC4KCkFub3RoZXIgaXNzdWUgY2FuIGJlIGVu
Y291bnRlcmVkIHdpdGggMiBTUEkgZmxhc2hlcyB1c2luZyAyIGRpZmZlcmVudApzcGVlZHMuIElu
IHRoaXMgc3BlY2lmaWMgY2FzZSB1c2FnZSBvZiBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCBpcyBu
b3QKZmxleGlibGUgY29tcGFyZWQgdG8gZ2V0IHRoZSAyIGRpZmZlcmVudCBzcGVlZHMgZnJvbSBE
VC4KCkJ5IGFkZGluZyBuZXcgcGFyYW1ldGVyICJ1c2VfZHQiIHRvIHNwaV9mbGFzaF9wcm9iZV9i
dXNfY3MoKSBhbmQgdG8Kc3BpX2dldF9idXNfYW5kX2NzKCksIHRoaXMgYWxsb3dzIHRvIGZvcmNl
IHVzYWdlIG9mIGVpdGhlciBzcGVlZCBhbmQKbW9kZSBmcm9tIERUICh1c2VfZHQgPSB0cnVlKSBv
ciB0byB1c2Ugc3BlZWQgYW5kIG1vZGUgcGFyYW1ldGVyIHZhbHVlLgoKU2lnbmVkLW9mZi1ieTog
UGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+CkNjOiBNYXJlayBC
ZWh1biA8bWFyZWsuYmVodW5AbmljLmN6PgpDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNv
bHV0aW9ucy5jb20+CkNjOiBWaWduZXNoIFIgPHZpZ25lc2hyQHRpLmNvbT4KQ2M6IEpvZSBIZXJz
aGJlcmdlciA8am9lLmhlcnNoYmVyZ2VyQG5pLmNvbT4KQ2M6IFJhbW9uIEZyaWVkIDxyZnJpZWQu
ZGV2QGdtYWlsLmNvbT4KQ2M6IEx1a2FzeiBNYWpld3NraSA8bHVrbWFAZGVueC5kZT4KQ2M6IE1h
cmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogV29sZmdhbmcgRGVuayA8d2RAZGVueC5kZT4K
Q2M6IFNpbW9uIEdsYXNzIDxzamdAY2hyb21pdW0ub3JnPgpDYzogU3RlZmFuIFJvZXNlIDxzckBk
ZW54LmRlPgpDYzogIlBhbGkgUm9ow6FyIiA8cGFsaUBrZXJuZWwub3JnPgpDYzogS29uc3RhbnRp
biBQb3JvdGNoa2luIDxrb3N0YXBAbWFydmVsbC5jb20+CkNjOiBJZ2FsIExpYmVybWFuIDxpZ2Fs
bEBtYXJ2ZWxsLmNvbT4KQ2M6IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+CkNjOiBQcmF0
eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+CkNjOiBTZWFuIEFuZGVyc29uIDxzZWFuZ2EyQGdt
YWlsLmNvbT4KQ2M6IEFuamkgSiA8YW5qaS5qYWdhcmxtdWRpQG54cC5jb20+CkNjOiBCaXdlbiBM
aSA8Yml3ZW4ubGlAbnhwLmNvbT4KQ2M6IFByaXlhbmthIEphaW4gPHByaXlhbmthLmphaW5Abnhw
LmNvbT4KQ2M6IENoYWl0YW55YSBTYWtpbmFtIDxjaGFpdGFueWEuc2FraW5hbUBueHAuY29tPgot
LS0KCiBib2FyZC9DWi5OSUMvdHVycmlzX21veC90dXJyaXNfbW94LmMgfCAgMiArLQogY21kL3Nm
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKy0KIGNtZC9zcGkuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL210ZC9zcGkvc2YtdWNsYXNz
LmMgICAgICAgICAgfCAgOCArKysrLS0tLQogZHJpdmVycy9uZXQvZm0vZm0uYyAgICAgICAgICAg
ICAgICAgIHwgIDUgKysrLS0KIGRyaXZlcnMvbmV0L3BmZV9ldGgvcGZlX2Zpcm13YXJlLmMgICB8
ICAyICstCiBkcml2ZXJzL25ldC9zbmlfbmV0c2VjLmMgICAgICAgICAgICAgfCAgMyArKy0KIGRy
aXZlcnMvc3BpL3NwaS11Y2xhc3MuYyAgICAgICAgICAgICB8ICA4ICsrKystLS0tCiBkcml2ZXJz
L3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuYyAgICAgfCAgMiArLQogZW52L3NmLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvc3BpLmggICAgICAgICAgICAgICAg
ICAgICAgICB8ICA5ICsrKysrLS0tLQogaW5jbHVkZS9zcGlfZmxhc2guaCAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHRlc3QvZG0vc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsr
KysrKysrLS0tLS0tLQogMTMgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9hcmQvQ1ouTklDL3R1cnJpc19tb3gvdHVycmlzX21v
eC5jIGIvYm9hcmQvQ1ouTklDL3R1cnJpc19tb3gvdHVycmlzX21veC5jCmluZGV4IDIyMDJlYjhj
ZmIuLjM2M2VkYzExNWYgMTAwNjQ0Ci0tLSBhL2JvYXJkL0NaLk5JQy90dXJyaXNfbW94L3R1cnJp
c19tb3guYworKysgYi9ib2FyZC9DWi5OSUMvdHVycmlzX21veC90dXJyaXNfbW94LmMKQEAgLTEz
NSw3ICsxMzUsNyBAQCBzdGF0aWMgaW50IG1veF9kb19zcGkodTggKmluLCB1OCAqb3V0LCBzaXpl
X3Qgc2l6ZSkKIAlzdHJ1Y3QgdWRldmljZSAqZGV2OwogCWludCByZXQ7CiAKLQlyZXQgPSBzcGlf
Z2V0X2J1c19hbmRfY3MoMCwgMSwgMTAwMDAwMCwgU1BJX0NQSEEgfCBTUElfQ1BPTCwKKwlyZXQg
PSBzcGlfZ2V0X2J1c19hbmRfY3MoMCwgMSwgMTAwMDAwMCwgU1BJX0NQSEEgfCBTUElfQ1BPTCwg
ZmFsc2UsCiAJCQkJICJzcGlfZ2VuZXJpY19kcnYiLCAibW94dGV0QDEiLCAmZGV2LAogCQkJCSAm
c2xhdmUpOwogCWlmIChyZXQpCmRpZmYgLS1naXQgYS9jbWQvc2YuYyBiL2NtZC9zZi5jCmluZGV4
IGVhYzI3ZWQyZDcuLjBjMWRkYmJhYjcgMTAwNjQ0Ci0tLSBhL2NtZC9zZi5jCisrKyBiL2NtZC9z
Zi5jCkBAIC05MSw2ICs5MSw3IEBAIHN0YXRpYyBpbnQgZG9fc3BpX2ZsYXNoX3Byb2JlKGludCBh
cmdjLCBjaGFyICpjb25zdCBhcmd2W10pCiAJdW5zaWduZWQgaW50IHNwZWVkID0gQ09ORklHX1NG
X0RFRkFVTFRfU1BFRUQ7CiAJdW5zaWduZWQgaW50IG1vZGUgPSBDT05GSUdfU0ZfREVGQVVMVF9N
T0RFOwogCWNoYXIgKmVuZHA7CisJYm9vbCB1c2VfZHQgPSB0cnVlOwogI2lmIENPTkZJR19JU19F
TkFCTEVEKERNX1NQSV9GTEFTSCkKIAlzdHJ1Y3QgdWRldmljZSAqbmV3LCAqYnVzX2RldjsKIAlp
bnQgcmV0OwpAQCAtMTE3LDExICsxMTgsMTMgQEAgc3RhdGljIGludCBkb19zcGlfZmxhc2hfcHJv
YmUoaW50IGFyZ2MsIGNoYXIgKmNvbnN0IGFyZ3ZbXSkKIAkJc3BlZWQgPSBzaW1wbGVfc3RydG91
bChhcmd2WzJdLCAmZW5kcCwgMCk7CiAJCWlmICgqYXJndlsyXSA9PSAwIHx8ICplbmRwICE9IDAp
CiAJCQlyZXR1cm4gLTE7CisJCXVzZV9kdCA9IGZhbHNlOwogCX0KIAlpZiAoYXJnYyA+PSA0KSB7
CiAJCW1vZGUgPSBoZXh0b3VsKGFyZ3ZbM10sICZlbmRwKTsKIAkJaWYgKCphcmd2WzNdID09IDAg
fHwgKmVuZHAgIT0gMCkKIAkJCXJldHVybiAtMTsKKwkJdXNlX2R0ID0gZmFsc2U7CiAJfQogCiAj
aWYgQ09ORklHX0lTX0VOQUJMRUQoRE1fU1BJX0ZMQVNIKQpAQCAtMTMxLDcgKzEzNCw3IEBAIHN0
YXRpYyBpbnQgZG9fc3BpX2ZsYXNoX3Byb2JlKGludCBhcmdjLCBjaGFyICpjb25zdCBhcmd2W10p
CiAJCWRldmljZV9yZW1vdmUobmV3LCBETV9SRU1PVkVfTk9STUFMKTsKIAl9CiAJZmxhc2ggPSBO
VUxMOwotCXJldCA9IHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoYnVzLCBjcywgc3BlZWQsIG1vZGUs
ICZuZXcpOworCXJldCA9IHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoYnVzLCBjcywgc3BlZWQsIG1v
ZGUsIHVzZV9kdCwgJm5ldyk7CiAJaWYgKHJldCkgewogCQlwcmludGYoIkZhaWxlZCB0byBpbml0
aWFsaXplIFNQSSBmbGFzaCBhdCAldToldSAoZXJyb3IgJWQpXG4iLAogCQkgICAgICAgYnVzLCBj
cywgcmV0KTsKZGlmZiAtLWdpdCBhL2NtZC9zcGkuYyBiL2NtZC9zcGkuYwppbmRleCA2ZGMzMjY3
OGRhLi40NmJkODE3ZTYwIDEwMDY0NAotLS0gYS9jbWQvc3BpLmMKKysrIGIvY21kL3NwaS5jCkBA
IC00Niw3ICs0Niw3IEBAIHN0YXRpYyBpbnQgZG9fc3BpX3hmZXIoaW50IGJ1cywgaW50IGNzKQog
CXN0ciA9IHN0cmR1cChuYW1lKTsKIAlpZiAoIXN0cikKIAkJcmV0dXJuIC1FTk9NRU07Ci0JcmV0
ID0gc3BpX2dldF9idXNfYW5kX2NzKGJ1cywgY3MsIGZyZXEsIG1vZGUsICJzcGlfZ2VuZXJpY19k
cnYiLAorCXJldCA9IHNwaV9nZXRfYnVzX2FuZF9jcyhidXMsIGNzLCBmcmVxLCBtb2RlLCBmYWxz
ZSwgInNwaV9nZW5lcmljX2RydiIsCiAJCQkJIHN0ciwgJmRldiwgJnNsYXZlKTsKIAlpZiAocmV0
KQogCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpL3NmLXVjbGFzcy5j
IGIvZHJpdmVycy9tdGQvc3BpL3NmLXVjbGFzcy5jCmluZGV4IDYzZDE2MjkxZmYuLmVmM2UzYmI5
ZGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL3NwaS9zZi11Y2xhc3MuYworKysgYi9kcml2ZXJz
L210ZC9zcGkvc2YtdWNsYXNzLmMKQEAgLTUxLDcgKzUxLDcgQEAgc3RydWN0IHNwaV9mbGFzaCAq
c3BpX2ZsYXNoX3Byb2JlKHVuc2lnbmVkIGludCBidXMsIHVuc2lnbmVkIGludCBjcywKIHsKIAlz
dHJ1Y3QgdWRldmljZSAqZGV2OwogCi0JaWYgKHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoYnVzLCBj
cywgbWF4X2h6LCBzcGlfbW9kZSwgJmRldikpCisJaWYgKHNwaV9mbGFzaF9wcm9iZV9idXNfY3Mo
YnVzLCBjcywgbWF4X2h6LCBzcGlfbW9kZSwgZmFsc2UsICZkZXYpKQogCQlyZXR1cm4gTlVMTDsK
IAogCXJldHVybiBkZXZfZ2V0X3VjbGFzc19wcml2KGRldik7CkBAIC01OSw3ICs1OSw3IEBAIHN0
cnVjdCBzcGlfZmxhc2ggKnNwaV9mbGFzaF9wcm9iZSh1bnNpZ25lZCBpbnQgYnVzLCB1bnNpZ25l
ZCBpbnQgY3MsCiAKIGludCBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKHVuc2lnbmVkIGludCBidXNu
dW0sIHVuc2lnbmVkIGludCBjcywKIAkJCSAgIHVuc2lnbmVkIGludCBtYXhfaHosIHVuc2lnbmVk
IGludCBzcGlfbW9kZSwKLQkJCSAgIHN0cnVjdCB1ZGV2aWNlICoqZGV2cCkKKwkJCSAgIGJvb2wg
dXNlX2R0LCBzdHJ1Y3QgdWRldmljZSAqKmRldnApCiB7CiAJc3RydWN0IHNwaV9zbGF2ZSAqc2xh
dmU7CiAJc3RydWN0IHVkZXZpY2UgKmJ1czsKQEAgLTc0LDggKzc0LDggQEAgaW50IHNwaV9mbGFz
aF9wcm9iZV9idXNfY3ModW5zaWduZWQgaW50IGJ1c251bSwgdW5zaWduZWQgaW50IGNzLAogCXNu
cHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwgInNwaV9mbGFzaEAlZDolZCIsIGJ1c251bSwgY3Mp
OwogCXN0ciA9IHN0cmR1cChuYW1lKTsKICNlbmRpZgotCXJldCA9IHNwaV9nZXRfYnVzX2FuZF9j
cyhidXNudW0sIGNzLCBtYXhfaHosIHNwaV9tb2RlLAotCQkJCSAgImplZGVjX3NwaV9ub3IiLCBz
dHIsICZidXMsICZzbGF2ZSk7CisJcmV0ID0gc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Ms
IG1heF9oeiwgc3BpX21vZGUsIHVzZV9kdCwKKwkJCQkgImplZGVjX3NwaV9ub3IiLCBzdHIsICZi
dXMsICZzbGF2ZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZm0vZm0uYyBiL2RyaXZlcnMvbmV0L2ZtL2ZtLmMKaW5kZXggN2Q1MWJlMWY3Mi4u
YzU2YWZjNmE0NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZm0vZm0uYworKysgYi9kcml2ZXJz
L25ldC9mbS9mbS5jCkBAIC0zODgsNyArMzg4LDggQEAgaW50IGZtX2luaXRfY29tbW9uKGludCBp
bmRleCwgc3RydWN0IGNjc3JfZm1hbiAqcmVnKQogCiAJCS8qIHNwZWVkIGFuZCBtb2RlIHdpbGwg
YmUgcmVhZCBmcm9tIERUICovCiAJCXJldCA9IHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoQ09ORklH
X0VOVl9TUElfQlVTLAotCQkJCQkgICAgIENPTkZJR19FTlZfU1BJX0NTLCAwLCAwLCAmbmV3KTsK
KwkJCQkJICAgICBDT05GSUdfRU5WX1NQSV9DUywgMCwgMCwgdHJ1ZSwKKwkJCQkJICAgICAmbmV3
KTsKIAogCQl1Y29kZV9mbGFzaCA9IGRldl9nZXRfdWNsYXNzX3ByaXYobmV3KTsKICNlbHNlCkBA
IC00NzUsNyArNDc2LDcgQEAgaW50IGZtX2luaXRfY29tbW9uKGludCBpbmRleCwgc3RydWN0IGNj
c3JfZm1hbiAqcmVnKQogCiAJLyogc3BlZWQgYW5kIG1vZGUgd2lsbCBiZSByZWFkIGZyb20gRFQg
Ki8KIAlyZXQgPSBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzKENPTkZJR19FTlZfU1BJX0JVUywgQ09O
RklHX0VOVl9TUElfQ1MsCi0JCQkJICAgICAwLCAwLCAmbmV3KTsKKwkJCQkgICAgIDAsIDAsIHRy
dWUsICZuZXcpOwogCiAJdWNvZGVfZmxhc2ggPSBkZXZfZ2V0X3VjbGFzc19wcml2KG5ldyk7CiAj
ZWxzZQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvcGZlX2V0aC9wZmVfZmlybXdhcmUuYyBiL2Ry
aXZlcnMvbmV0L3BmZV9ldGgvcGZlX2Zpcm13YXJlLmMKaW5kZXggYWQ1YmMzYzg2Mi4uZDMwOTkx
NTcxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvcGZlX2V0aC9wZmVfZmlybXdhcmUuYworKysg
Yi9kcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5jCkBAIC0xODMsNyArMTgzLDcgQEAg
aW50IHBmZV9zcGlfZmxhc2hfaW5pdCh2b2lkKQogCQkJCSAgICAgQ09ORklHX0VOVl9TUElfQ1Ms
CiAJCQkJICAgICBDT05GSUdfRU5WX1NQSV9NQVhfSFosCiAJCQkJICAgICBDT05GSUdfRU5WX1NQ
SV9NT0RFLAotCQkJCSAgICAgJm5ldyk7CisJCQkJICAgICB0cnVlLCAmbmV3KTsKIAlpZiAocmV0
KSB7CiAJCXByaW50ZigiU0Y6IGZhaWxlZCB0byBwcm9iZSBzcGlcbiIpOwogCQlmcmVlKGFkZHIp
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvc25pX25ldHNlYy5jIGIvZHJpdmVycy9uZXQvc25p
X25ldHNlYy5jCmluZGV4IDQ5MDEzMjFkMGMuLjZkMDBhM2ZkM2EgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbmV0L3NuaV9uZXRzZWMuYworKysgYi9kcml2ZXJzL25ldC9zbmlfbmV0c2VjLmMKQEAgLTYy
NSw3ICs2MjUsOCBAQCBzdGF0aWMgdm9pZCBuZXRzZWNfc3BpX3JlYWQoY2hhciAqYnVmLCBsb2Zm
X3QgbGVuLCBsb2ZmX3Qgb2Zmc2V0KQogCXN0cnVjdCBzcGlfZmxhc2ggKmZsYXNoOwogCiAJc3Bp
X2ZsYXNoX3Byb2JlX2J1c19jcyhDT05GSUdfU0ZfREVGQVVMVF9CVVMsIENPTkZJR19TRl9ERUZB
VUxUX0NTLAotCQkJICAgICAgIENPTkZJR19TRl9ERUZBVUxUX1NQRUVELCBDT05GSUdfU0ZfREVG
QVVMVF9NT0RFLCAmbmV3KTsKKwkJCSAgICAgICBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCwgQ09O
RklHX1NGX0RFRkFVTFRfTU9ERSwKKwkJCSAgICAgICB0cnVlLCAmbmV3KTsKIAlmbGFzaCA9IGRl
dl9nZXRfdWNsYXNzX3ByaXYobmV3KTsKIAogCXNwaV9mbGFzaF9yZWFkKGZsYXNoLCBvZmZzZXQs
IGxlbiwgYnVmKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS11Y2xhc3MuYyBiL2RyaXZl
cnMvc3BpL3NwaS11Y2xhc3MuYwppbmRleCBmOGVjMzEyZDcxLi40MzY2MTI0ZTNjIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3NwaS9zcGktdWNsYXNzLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXVjbGFz
cy5jCkBAIC0zNDAsNyArMzQwLDcgQEAgaW50IHNwaV9maW5kX2J1c19hbmRfY3MoaW50IGJ1c251
bSwgaW50IGNzLCBzdHJ1Y3QgdWRldmljZSAqKmJ1c3AsCiAJcmV0dXJuIHJldDsKIH0KIAotaW50
IHNwaV9nZXRfYnVzX2FuZF9jcyhpbnQgYnVzbnVtLCBpbnQgY3MsIGludCBzcGVlZCwgaW50IG1v
ZGUsCitpbnQgc3BpX2dldF9idXNfYW5kX2NzKGludCBidXNudW0sIGludCBjcywgaW50IHNwZWVk
LCBpbnQgbW9kZSwgYm9vbCB1c2VfZHQsCiAJCSAgICAgICBjb25zdCBjaGFyICpkcnZfbmFtZSwg
Y29uc3QgY2hhciAqZGV2X25hbWUsCiAJCSAgICAgICBzdHJ1Y3QgdWRldmljZSAqKmJ1c3AsIHN0
cnVjdCBzcGlfc2xhdmUgKipkZXZwKQogewpAQCAtNDE5LDggKzQxOSw4IEBAIGludCBzcGlfZ2V0
X2J1c19hbmRfY3MoaW50IGJ1c251bSwgaW50IGNzLCBpbnQgc3BlZWQsIGludCBtb2RlLAogCX0K
IAogCS8qIEluIGNhc2UgYnVzIGZyZXF1ZW5jeSBvciBtb2RlIGNoYW5nZWQsIHVwZGF0ZSBpdC4g
Ki8KLQlpZiAoKHNwZWVkICYmIGJ1c19kYXRhLT5zcGVlZCAmJiBidXNfZGF0YS0+c3BlZWQgIT0g
c3BlZWQpIHx8Ci0JICAgIChwbGF0ICYmIHBsYXQtPm1vZGUgIT0gbW9kZSkpIHsKKwlpZiAoKChz
cGVlZCAmJiBidXNfZGF0YS0+c3BlZWQgJiYgYnVzX2RhdGEtPnNwZWVkICE9IHNwZWVkKSB8fAor
CSAgICAgKHBsYXQgJiYgcGxhdC0+bW9kZSAhPSBtb2RlKSkgJiYgIXVzZV9kdCkgewogCQlyZXQg
PSBzcGlfc2V0X3NwZWVkX21vZGUoYnVzLCBzcGVlZCwgbW9kZSk7CiAJCWlmIChyZXQpCiAJCQln
b3RvIGVycl9zcGVlZF9tb2RlOwpAQCAtNDUzLDcgKzQ1Myw3IEBAIHN0cnVjdCBzcGlfc2xhdmUg
KnNwaV9zZXR1cF9zbGF2ZSh1bnNpZ25lZCBpbnQgYnVzbnVtLCB1bnNpZ25lZCBpbnQgY3MsCiAJ
c3RydWN0IHVkZXZpY2UgKmRldjsKIAlpbnQgcmV0OwogCi0JcmV0ID0gc3BpX2dldF9idXNfYW5k
X2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLCBOVUxMLCAwLCAmZGV2LAorCXJldCA9IHNwaV9n
ZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzLCBzcGVlZCwgbW9kZSwgZmFsc2UsIE5VTEwsIDAsICZk
ZXYsCiAJCQkJICZzbGF2ZSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIE5VTEw7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC9t
YXgzNDIwX3VkYy5jCmluZGV4IGExNjA5NWY4OTIuLmNjZWMzMzdmOTkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdXNiL2dhZGdldC9tYXgzNDIwX3VkYy5jCisrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC9t
YXgzNDIwX3VkYy5jCkBAIC04MzAsNyArODMwLDcgQEAgc3RhdGljIGludCBtYXgzNDIwX3VkY19w
cm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KQogCWNzID0gc2xhdmVfcGRhdGEtPmNzOwogCXNwZWVk
ID0gc2xhdmVfcGRhdGEtPm1heF9oejsKIAltb2RlID0gc2xhdmVfcGRhdGEtPm1vZGU7Ci0Jc3Bp
X2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLCAic3BpX2dlbmVyaWNfZHJ2
IiwKKwlzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgc3BlZWQsIG1vZGUsIGZhbHNlLCAi
c3BpX2dlbmVyaWNfZHJ2IiwKIAkJCSAgIE5VTEwsICZzcGlkLCAmdWRjLT5zbGF2ZSk7CiAKIAl1
ZGMtPmRldiA9IGRldjsKZGlmZiAtLWdpdCBhL2Vudi9zZi5jIGIvZW52L3NmLmMKaW5kZXggNmE0
YmI3NTZmMC4uZWQ2YmZiMjExNSAxMDA2NDQKLS0tIGEvZW52L3NmLmMKKysrIGIvZW52L3NmLmMK
QEAgLTUzLDcgKzUzLDcgQEAgc3RhdGljIGludCBzZXR1cF9mbGFzaF9kZXZpY2Uoc3RydWN0IHNw
aV9mbGFzaCAqKmVudl9mbGFzaCkKIAkvKiBzcGVlZCBhbmQgbW9kZSB3aWxsIGJlIHJlYWQgZnJv
bSBEVCAqLwogCXJldCA9IHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoQ09ORklHX0VOVl9TUElfQlVT
LCBDT05GSUdfRU5WX1NQSV9DUywKIAkJCQkgICAgIENPTkZJR19FTlZfU1BJX01BWF9IWiwgQ09O
RklHX0VOVl9TUElfTU9ERSwKLQkJCQkgICAgICZuZXcpOworCQkJCSAgICAgdHJ1ZSwgJm5ldyk7
CiAJaWYgKHJldCkgewogCQllbnZfc2V0X2RlZmF1bHQoInNwaV9mbGFzaF9wcm9iZV9idXNfY3Mo
KSBmYWlsZWQiLCAwKTsKIAkJcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc3BpLmgg
Yi9pbmNsdWRlL3NwaS5oCmluZGV4IGRjM2IyMTEzMmEuLjVkMTJmMjdiMTkgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvc3BpLmgKKysrIGIvaW5jbHVkZS9zcGkuaApAQCAtNTgyLDE1ICs1ODIsMTYgQEAg
aW50IHNwaV9maW5kX2J1c19hbmRfY3MoaW50IGJ1c251bSwgaW50IGNzLCBzdHJ1Y3QgdWRldmlj
ZSAqKmJ1c3AsCiAgKiBAY3M6CQlDaGlwIHNlbGVjdCB0byBsb29rIGZvcgogICogQHNwZWVkOglT
UEkgc3BlZWQgdG8gdXNlIGZvciB0aGlzIHNsYXZlIHdoZW4gbm90IGF2YWlsYWJsZSBpbiBwbGF0
CiAgKiBAbW9kZToJU1BJIG1vZGUgdG8gdXNlIGZvciB0aGlzIHNsYXZlIHdoZW4gbm90IGF2YWls
YWJsZSBpbiBwbGF0CisgKiBAdXNlX2R0OiAgICAgRm9yY2UgdXNhZ2Ugb2YgU1BJIHNwZWVkIGFu
ZCBTUEkgbW9kZSBmcm9tIERUCiAgKiBAZHJ2X25hbWU6CU5hbWUgb2YgZHJpdmVyIHRvIGF0dGFj
aCB0byB0aGlzIGNoaXAgc2VsZWN0CiAgKiBAZGV2X25hbWU6CU5hbWUgb2YgdGhlIG5ldyBkZXZp
Y2UgdGh1cyBjcmVhdGVkCiAgKiBAYnVzcDoJUmV0dXJucyBidXMgZGV2aWNlCiAgKiBAZGV2cDoJ
UmV0dXJuIHNsYXZlIGRldmljZQotICogQHJldHVybiAwIGlmIGZvdW5kLCAtdmUgb24gZXJyb3IK
KyAgKiBAcmV0dXJuIDAgaWYgZm91bmQsIC12ZSBvbiBlcnJvcgogICovCi1pbnQgc3BpX2dldF9i
dXNfYW5kX2NzKGludCBidXNudW0sIGludCBjcywgaW50IHNwZWVkLCBpbnQgbW9kZSwKLQkJCWNv
bnN0IGNoYXIgKmRydl9uYW1lLCBjb25zdCBjaGFyICpkZXZfbmFtZSwKLQkJCXN0cnVjdCB1ZGV2
aWNlICoqYnVzcCwgc3RydWN0IHNwaV9zbGF2ZSAqKmRldnApOworaW50IHNwaV9nZXRfYnVzX2Fu
ZF9jcyhpbnQgYnVzbnVtLCBpbnQgY3MsIGludCBzcGVlZCwgaW50IG1vZGUsIGJvb2wgdXNlX2R0
LAorCQkgICAgICAgY29uc3QgY2hhciAqZHJ2X25hbWUsIGNvbnN0IGNoYXIgKmRldl9uYW1lLAor
CQkgICAgICAgc3RydWN0IHVkZXZpY2UgKipidXNwLCBzdHJ1Y3Qgc3BpX3NsYXZlICoqZGV2cCk7
CiAKIC8qKgogICogc3BpX2NoaXBfc2VsZWN0KCkgLSBHZXQgdGhlIGNoaXAgc2VsZWN0IGZvciBh
IHNsYXZlCmRpZmYgLS1naXQgYS9pbmNsdWRlL3NwaV9mbGFzaC5oIGIvaW5jbHVkZS9zcGlfZmxh
c2guaAppbmRleCA0ZDRhZTg5YzE5Li4wN2JjYTFlZTNiIDEwMDY0NAotLS0gYS9pbmNsdWRlL3Nw
aV9mbGFzaC5oCisrKyBiL2luY2x1ZGUvc3BpX2ZsYXNoLmgKQEAgLTExNyw3ICsxMTcsNyBAQCBp
bnQgc3BpX2ZsYXNoX3N0ZF9wcm9iZShzdHJ1Y3QgdWRldmljZSAqZGV2KTsKIAogaW50IHNwaV9m
bGFzaF9wcm9iZV9idXNfY3ModW5zaWduZWQgaW50IGJ1c251bSwgdW5zaWduZWQgaW50IGNzLAog
CQkJICAgdW5zaWduZWQgaW50IG1heF9oeiwgdW5zaWduZWQgaW50IHNwaV9tb2RlLAotCQkJICAg
c3RydWN0IHVkZXZpY2UgKipkZXZwKTsKKwkJCSAgIGJvb2wgdXNlX2R0LCBzdHJ1Y3QgdWRldmlj
ZSAqKmRldnApOwogCiAvKiBDb21wYXRpYmlsaXR5IGZ1bmN0aW9uIC0gdGhpcyBpcyB0aGUgb2xk
IFUtQm9vdCBBUEkgKi8KIHN0cnVjdCBzcGlfZmxhc2ggKnNwaV9mbGFzaF9wcm9iZSh1bnNpZ25l
ZCBpbnQgYnVzLCB1bnNpZ25lZCBpbnQgY3MsCmRpZmYgLS1naXQgYS90ZXN0L2RtL3NwaS5jIGIv
dGVzdC9kbS9zcGkuYwppbmRleCBlZTRhZDNhYmFhLi4yYjFmNTUzNWM2IDEwMDY0NAotLS0gYS90
ZXN0L2RtL3NwaS5jCisrKyBiL3Rlc3QvZG0vc3BpLmMKQEAgLTQ3LDcgKzQ3LDcgQEAgc3RhdGlj
IGludCBkbV90ZXN0X3NwaV9maW5kKHN0cnVjdCB1bml0X3Rlc3Rfc3RhdGUgKnV0cykKIAkvKiBU
aGlzIGZpbmRzIG5vdGhpbmcgYmVjYXVzZSB3ZSByZW1vdmVkIHRoZSBkZXZpY2UgKi8KIAl1dF9h
c3NlcnRlcSgtRU5PREVWLCBzcGlfZmluZF9idXNfYW5kX2NzKGJ1c251bSwgY3MsICZidXMsICZk
ZXYpKTsKIAl1dF9hc3NlcnRlcSgtRU5PREVWLCBzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBj
cywgc3BlZWQsIG1vZGUsCi0JCQkJCQlOVUxMLCAwLCAmYnVzLCAmc2xhdmUpKTsKKwkJCQkJCWZh
bHNlLCBOVUxMLCAwLCAmYnVzLCAmc2xhdmUpKTsKIAogCS8qCiAJICogVGhpcyBmb3JjZXMgdGhl
IGRldmljZSB0byBiZSByZS1hZGRlZCwgYnV0IHRoZXJlIGlzIG5vIGVtdWxhdGlvbgpAQCAtNTYs
NyArNTYsNyBAQCBzdGF0aWMgaW50IGRtX3Rlc3Rfc3BpX2ZpbmQoc3RydWN0IHVuaXRfdGVzdF9z
dGF0ZSAqdXRzKQogCSAqIGEgJ3BhcnRpYWxseS1pbml0ZWQnIGRldmljZS4KIAkgKi8KIAl1dF9h
c3NlcnRlcSgtRU5PREVWLCBzcGlfZmluZF9idXNfYW5kX2NzKGJ1c251bSwgY3MsICZidXMsICZk
ZXYpKTsKLQl1dF9hc3NlcnRlcSgtRU5PRU5ULCBzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBj
cywgc3BlZWQsIG1vZGUsCisJdXRfYXNzZXJ0ZXEoLUVOT0VOVCwgc3BpX2dldF9idXNfYW5kX2Nz
KGJ1c251bSwgY3MsIHNwZWVkLCBtb2RlLCBmYWxzZSwKIAkJCQkJCSJqZWRlY19zcGlfbm9yIiwg
Im5hbWUiLCAmYnVzLAogCQkJCQkJJnNsYXZlKSk7CiAJc2FuZGJveF9zZl91bmJpbmRfZW11bChz
dGF0ZV9nZXRfY3VycmVudCgpLCBidXNudW0sIGNzKTsKQEAgLTY3LDcgKzY3LDcgQEAgc3RhdGlj
IGludCBkbV90ZXN0X3NwaV9maW5kKHN0cnVjdCB1bml0X3Rlc3Rfc3RhdGUgKnV0cykKIAl1dF9h
c3NlcnRvayhzYW5kYm94X3NmX2JpbmRfZW11bChzdGF0ZSwgYnVzbnVtLCBjcywgYnVzLCBub2Rl
LAogCQkJCQkgIm5hbWUiKSk7CiAJdXRfYXNzZXJ0b2soc3BpX2ZpbmRfYnVzX2FuZF9jcyhidXNu
dW0sIGNzLCAmYnVzLCAmZGV2KSk7Ci0JdXRfYXNzZXJ0b2soc3BpX2dldF9idXNfYW5kX2NzKGJ1
c251bSwgY3MsIHNwZWVkLCBtb2RlLAorCXV0X2Fzc2VydG9rKHNwaV9nZXRfYnVzX2FuZF9jcyhi
dXNudW0sIGNzLCBzcGVlZCwgbW9kZSwgZmFsc2UsCiAJCQkJICAgICAgICJqZWRlY19zcGlfbm9y
IiwgIm5hbWUiLCAmYnVzLCAmc2xhdmUpKTsKIAogCXV0X2Fzc2VydG9rKHNwaV9jc19pbmZvKGJ1
cywgY3MsICZpbmZvKSk7CkBAIC03Nyw3ICs3Nyw4IEBAIHN0YXRpYyBpbnQgZG1fdGVzdF9zcGlf
ZmluZChzdHJ1Y3QgdW5pdF90ZXN0X3N0YXRlICp1dHMpCiAJdXRfYXNzZXJ0b2soc2FuZGJveF9z
Zl9iaW5kX2VtdWwoc3RhdGUsIGJ1c251bSwgY3NfYiwgYnVzLCBub2RlLAogCQkJCQkgIm5hbWUi
KSk7CiAJdXRfYXNzZXJ0ZXEoLUVJTlZBTCwgc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3Nf
Yiwgc3BlZWQsIG1vZGUsCi0JCQkJICAgICAgICJqZWRlY19zcGlfbm9yIiwgIm5hbWUiLCAmYnVz
LCAmc2xhdmUpKTsKKwkJCQkJCWZhbHNlLCAiamVkZWNfc3BpX25vciIsICJuYW1lIiwKKwkJCQkJ
CSZidXMsICZzbGF2ZSkpOwogCXV0X2Fzc2VydGVxKC1FSU5WQUwsIHNwaV9jc19pbmZvKGJ1cywg
Y3NfYiwgJmluZm8pKTsKIAl1dF9hc3NlcnRlcV9wdHIoTlVMTCwgaW5mby5kZXYpOwogCkBAIC0x
NDUsMTAgKzE0NiwxMCBAQCBzdGF0aWMgaW50IGRtX3Rlc3Rfc3BpX2NsYWltX2J1cyhzdHJ1Y3Qg
dW5pdF90ZXN0X3N0YXRlICp1dHMpCiAJY29uc3QgaW50IGJ1c251bSA9IDAsIGNzX2EgPSAwLCBj
c19iID0gMSwgbW9kZSA9IDA7CiAKIAkvKiBHZXQgc3BpIHNsYXZlIG9uIENTMCAqLwotCXV0X2Fz
c2VydG9rKHNwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzX2EsIDEwMDAwMDAsIG1vZGUsIE5V
TEwsIDAsCisJdXRfYXNzZXJ0b2soc3BpX2dldF9idXNfYW5kX2NzKGJ1c251bSwgY3NfYSwgMTAw
MDAwMCwgbW9kZSwgZmFsc2UsIE5VTEwsIDAsCiAJCQkJICAgICAgICZidXMsICZzbGF2ZV9hKSk7
CiAJLyogR2V0IHNwaSBzbGF2ZSBvbiBDUzEgKi8KLQl1dF9hc3NlcnRvayhzcGlfZ2V0X2J1c19h
bmRfY3MoYnVzbnVtLCBjc19iLCAxMDAwMDAwLCBtb2RlLCBOVUxMLCAwLAorCXV0X2Fzc2VydG9r
KHNwaV9nZXRfYnVzX2FuZF9jcyhidXNudW0sIGNzX2IsIDEwMDAwMDAsIG1vZGUsIGZhbHNlLCBO
VUxMLCAwLAogCQkJCSAgICAgICAmYnVzLCAmc2xhdmVfYikpOwogCiAJLyogRGlmZmVyZW50IG1h
eF9oeiwgZGlmZmVyZW50IG1vZGUuICovCkBAIC0xODIsNyArMTgzLDcgQEAgc3RhdGljIGludCBk
bV90ZXN0X3NwaV94ZmVyKHN0cnVjdCB1bml0X3Rlc3Rfc3RhdGUgKnV0cykKIAljb25zdCBjaGFy
IGRvdXRbNV0gPSB7MHg5Zn07CiAJdW5zaWduZWQgY2hhciBkaW5bNV07CiAKLQl1dF9hc3NlcnRv
ayhzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgMTAwMDAwMCwgbW9kZSwgTlVMTCwgMCwK
Kwl1dF9hc3NlcnRvayhzcGlfZ2V0X2J1c19hbmRfY3MoYnVzbnVtLCBjcywgMTAwMDAwMCwgbW9k
ZSwgZmFsc2UsIE5VTEwsIDAsCiAJCQkJICAgICAgICZidXMsICZzbGF2ZSkpOwogCXV0X2Fzc2Vy
dG9rKHNwaV9jbGFpbV9idXMoc2xhdmUpKTsKIAl1dF9hc3NlcnRvayhzcGlfeGZlcihzbGF2ZSwg
NDAsIGRvdXQsIGRpbiwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
