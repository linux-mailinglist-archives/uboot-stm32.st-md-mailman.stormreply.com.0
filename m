Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7649394001
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 May 2021 11:33:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9922AC57189;
	Fri, 28 May 2021 09:33:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51CCCC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 May 2021 09:33:04 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S9WHnB030003; Fri, 28 May 2021 11:32:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oTUsZUblb150H0plhTp3p0hQsj2qf/Eif6IkiE7Fs14=;
 b=14LG7YoIULLEvke5N9+fun1VYMl1IkPKlJdcuqux+hZN7VvBjGOnzXNXpXANemgYqYjc
 v/Nf/YRtYtTagtITq6IOhAe4V+Y9a3FZ20Jvs0iMgmgwz/p3g9EPSbZG9+6JqsCvhliV
 93yIZJL0J1EhpQH+4K+X4IvywHUuHhLpFQQd99KemWdg1cNoeOdA87YGf7TKQ3TgNA+W
 u+XfjvG815Qdf1P6cJFID+tMSebTC40PXTjhbczboBjhD7kz2yd/XL3GLs8X0kTBzbgH
 xuDziFYZwdsLLYV7cDBcZ8hdJT4ccoaIq/tIIdJfR4VfXDdIkezWT17PVZQAIlszE2hD wQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t7k3f4gy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 11:32:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA9E310002A;
 Fri, 28 May 2021 11:32:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7E0CB21E67C;
 Fri, 28 May 2021 11:32:55 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 May
 2021 11:32:54 +0200
To: Sughosh Ganu <sughosh.ganu@linaro.org>
References: <20210310102719.1.Ieb141155065c9aaf05a0199ef688e1eb3ba0e621@changeid>
 <CADg8p97Gik+WJD0ak7Snn-k47M-3oCby_H-F3MQufnj4J-p3QQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <72934a5a-9c12-3ada-20e5-d64780e191ce@foss.st.com>
Date: Fri, 28 May 2021 11:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADg8p97Gik+WJD0ak7Snn-k47M-3oCby_H-F3MQufnj4J-p3QQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_04:2021-05-27,
 2021-05-28 signatures=0
Cc: Tom Rini <trini@konsulko.com>, Takahiro Akashi <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Lukasz Majewski <lukma@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Alexander Graf <agraf@csgraf.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Subject: Re: [Uboot-stm32] [PATCH] dfu: dfu_mtd: remove the mtd_block_op
 error when mtd_lock is not supported
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGksCgpPbiAzLzEwLzIxIDEyOjE1IFBNLCBTdWdob3NoIEdhbnUgd3JvdGU6Cj4KPgo+IE9uIFdl
ZCwgMTAgTWFyIDIwMjEgYXQgMTQ6NTcsIFBhdHJpY2sgRGVsYXVuYXkgCj4gPHBhdHJpY2suZGVs
YXVuYXlAZm9zcy5zdC5jb20gPG1haWx0bzpwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPj4g
Cj4gd3JvdGU6Cj4KPiAgICAgRml4IHRoZSByZXN1bHQgb2YgREZVX09QX1dSSVRFIG9wZXJhdGlv
biBpbiBtdGRfYmxvY2tfb3AgZnVuY3Rpb24KPiAgICAgd2hlbiBtdGRfbG9jayBpcyBub3Qgc3Vw
cG9ydGVkICgtRU9QTk9UU1VQUCkgdG8gYXZvaWQgREZVIHN0YWNrCj4gICAgIGVycm9yIG9uIHRo
ZSBERlUgbWFuaWZlc3RhdGlvbiBvZiB0aGUgTVREIGRldmljZSwgd2hlbgo+ICAgICBkZnVfZmx1
c2hfbWVkaXVtX210ZCBpcyBjYWxsZWQuCj4KPiAgICAgV2l0aG91dCB0aGlzIHBhdGNoLCBkZnUt
dXRpbCBmYWlsZWQgb24gZGZ1RVJST1Igc3RhdGUgYXQgdGhlIGVuZAo+ICAgICBvZiB0aGUgd3Jp
dGUgb3BlcmF0aW9uIG9uIHRoZSBhbHRlcm5hdGUgZXZlbiBpZiBNVEQgd3JpdGUKPiAgICAgb3Bl
YXJ0aW9uIGlzIGNvcnJlY3RseSBwZXJmb3JtZWQuCj4KPiAgICAgJD4gZGZ1LXV0aWwgLWEgMyAt
RCB0ZXN0LmJpbgo+ICAgICAuLi4uCj4gICAgIERGVSBtb2RlIGRldmljZSBERlUgdmVyc2lvbiAw
MTEwCj4gICAgIERldmljZSByZXR1cm5lZCB0cmFuc2ZlciBzaXplIDQwOTYKPiAgICAgQ29weWlu
ZyBkYXRhIGZyb20gUEMgdG8gREZVIGRldmljZQo+ICAgICAuLi4uCj4gICAgIERvd25sb2FkwqAg
wqAgwqAgwqAgWz09PT09PT09PT09PT09PT09PT09PT09PT1dIDEwMCUgwqAyMjU0NjkgYnl0ZXMK
PiAgICAgRG93bmxvYWQgZG9uZS4KPiAgICAgc3RhdGUoMTApID0gZGZ1RVJST1IsIHN0YXR1cygx
NCkgPSBTb21ldGhpbmcgd2VudCB3cm9uZywKPiAgICAgwqAgYnV0IHRoZSBkZXZpY2UgZG9lcyBu
b3Qga25vdyB3aGF0IGl0IHdhcyBEb25lIQo+Cj4gICAgIEZpeGVzOiA2NWYzZmMxOGZjMWUgKCJk
ZnVfbXRkOiBBZGQgcHJvdmlzaW9uIHRvIHVubG9jayBtdGQgZGV2aWNlIikKPiAgICAgU2lnbmVk
LW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbQo+
ICAgICA8bWFpbHRvOnBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Pgo+ICAgICAtLS0KPgo+
Cj4gQWNrZWQtYnk6IFN1Z2hvc2ggR2FudSA8c3VnaG9zaC5nYW51QGxpbmFyby5vcmcgCj4gPG1h
aWx0bzpzdWdob3NoLmdhbnVAbGluYXJvLm9yZz4+Cj4KPgo+ICAgICDCoGRyaXZlcnMvZGZ1L2Rm
dV9tdGQuYyB8IDQgKysrLQo+ICAgICDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPgo+ICAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kZnUvZGZ1X210ZC5j
IGIvZHJpdmVycy9kZnUvZGZ1X210ZC5jCj4gICAgIGluZGV4IGNhNjc1ODVhN2UuLmVjNDBiOGY2
YmIgMTAwNjQ0Cj4gICAgIC0tLSBhL2RyaXZlcnMvZGZ1L2RmdV9tdGQuYwo+ICAgICArKysgYi9k
cml2ZXJzL2RmdS9kZnVfbXRkLmMKPiAgICAgQEAgLTE1MCw3ICsxNTAsOSBAQCBzdGF0aWMgaW50
IG10ZF9ibG9ja19vcChlbnVtIGRmdV9vcCBvcCwgc3RydWN0Cj4gICAgIGRmdV9lbnRpdHkgKmRm
dSwKPiAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogV3JpdGUgZG9uZSwgbG9jayBhZ2Fp
biAqLwo+ICAgICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkZWJ1ZygiTG9ja2luZyB0aGUgbXRk
IGRldmljZVxuIik7Cj4gICAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9IG10ZF9sb2Nr
KG10ZCwgbG9ja19vZnMsIGxvY2tfbGVuKTsKPiAgICAgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aWYgKHJldCAmJiByZXQgIT0gLUVPUE5PVFNVUFApCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGlmIChyZXQgPT0gLUVPUE5PVFNVUFApCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJldCA9IDA7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2Ug
aWYgKHJldCkKPiAgICAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJpbnRm
KCJNVEQgZGV2aWNlIGxvY2sgZmFpbGVkXG4iKTsKPiAgICAgwqAgwqAgwqAgwqAgfQo+ICAgICDC
oCDCoCDCoCDCoCByZXR1cm4gcmV0Owo+ICAgICAtLSAKPiAgICAgMi4xNy4xCj4KCkFwcGxpZWQg
dG8gdS1ib290LXN0bS9tYXN0ZXIsIHRoYW5rcyEKClNlZSByZXF1ZXN0IGluCgpSZTogW1BBVENI
IHY0IDEyLzE0XSBkZnVfbXRkOiBJZ25vcmUgbm9uLWltcGxlbWVudGVkIGxvY2sgZGV2aWNlIGZh
aWx1cmUKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzE2
MjE0MDMxOTM4OS40NzI1Ni42Mjk3Mjg5NDUyNDYxNzg4NjAuc3RnaXRAbG9jYWxob3N0LyMyNjg1
MzkxCgpodHRwOi8vdS1ib290LjEwOTEyLm43Lm5hYmJsZS5jb20vUEFUQ0gtdjQtMDAtMTQtYXJt
NjQtc3lucXVhY2VyLUFkZC1TeW5RdWFjZXItRGV2ZWxvcGVyQm94LXN1cHBvcnQtdHA0NTAyMzFw
NDUwMjQzLmh0bWwKCgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
