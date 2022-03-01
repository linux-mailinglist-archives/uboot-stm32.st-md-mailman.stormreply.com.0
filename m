Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D434C8999
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Mar 2022 11:46:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EF52C5F1F1;
	Tue,  1 Mar 2022 10:46:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E7A5C5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Mar 2022 10:46:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2219QB13002501;
 Tue, 1 Mar 2022 11:44:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qbb0V3LnFkd8/czJOZNFda0Gqx2Dfjp06skiVO7NPmw=;
 b=jvzrp6YCnuPVCfWueH5Wc0223cg3NuF1DR1O0iVUL3eF14aydnntCKnzpCinNzO8dtFW
 wivzoKYiJw/S3+HU7ZRmYdO7PTj3p+Fn8TKx694u66N5Dl/oO/vSO77Q6nrJcGrZeYRO
 60Fk8Q0kVE3jd6C58n1JyHB0Kf+Z9ax1ETfI4AKTDMSNpnMd6Tao13YMo0vNkfNwYDBh
 ryqHQmVgrSvGs0Hxi/I0GJ9kguLeWsArvDlMcznJ4cPxDEcMLdDNas9Tw1x5xk/AJoEY
 ntzDfMZAADmDg1fpaGpxwCb04TAlHbSl0YgxSNZuuJ6kVyptKo6roTJ4rgMCGS3glG9s ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ehakf2fyy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 11:44:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4EA4710002A;
 Tue,  1 Mar 2022 11:44:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F08621B532;
 Tue,  1 Mar 2022 11:44:52 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 1 Mar
 2022 11:44:51 +0100
Message-ID: <9eba2ef3-d450-9d7b-6113-2e646d4b016e@foss.st.com>
Date: Tue, 1 Mar 2022 11:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20220112105908.7388-1-patrice.chotard@foss.st.com>
 <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
 <e4b1c0a9-2dac-f7b7-6a63-a83b6a515566@foss.st.com>
 <CAPnjgZ1mhYfVQrhPju0tPLjFFym_zvnejy=W95HpK7ADzT635A@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAPnjgZ1mhYfVQrhPju0tPLjFFym_zvnejy=W95HpK7ADzT635A@mail.gmail.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
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
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Uboot-stm32] [PATCH] spi: Add spi_get_bus_and_cs() new use_dt
	param
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

SGkgU2ltb24KCk9uIDIvMjYvMjIgMTk6MzYsIFNpbW9uIEdsYXNzIHdyb3RlOgo+IEhpIFBhdHJp
Y2UsCj4gCj4gT24gTW9uLCAzMSBKYW4gMjAyMiBhdCAwOToxNCwgUGF0cmljZSBDSE9UQVJECj4g
PHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIFNpbW9uCj4+Cj4+
IE9uIDEvMjEvMjIgMTY6MjAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+Pj4gSGkgUGF0cmljZSwKPj4+
Cj4+PiBPbiBXZWQsIDEyIEphbiAyMDIyIGF0IDAzOjU5LCBQYXRyaWNlIENob3RhcmQKPj4+IDxw
YXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4gQWRkIHNwaV9mbGFz
aF9wcm9iZV9idXNfY3MoKSBhbmQgc3BpX2dldF9idXNfYW5kX2NzKCkgbmV3ICJ1c2VfZHQiCj4+
Pj4gcGFyYW0gd2hpY2ggYWxsb3dzIHRvIHNlbGVjdCBTUEkgc3BlZWQgYW5kIG1vZGUgZnJvbSBE
VCBvciBmcm9tCj4+Pj4gZGVmYXVsdCB2YWx1ZSBwYXNzZWQgaW4gcGFyYW1ldGVycy4KPj4+Pgo+
Pj4+IFNpbmNlIGNvbW1pdCBlMmU5NWU1ZTI1NDIgKCJzcGk6IFVwZGF0ZSBzcGVlZC9tb2RlIG9u
IGNoYW5nZSIpCj4+Pj4gd2hlbiBjYWxsaW5nICJzZiBwcm9iZSIgb3IgImVudiBzYXZlIiBvbiBT
UEkgZmxhc2gsCj4+Pj4gc3BpX3NldF9zcGVlZF9tb2RlKCkgaXMgY2FsbGVkIHR3aWNlLgo+Pj4+
Cj4+Pj4gc3BpX2dldF9idXNfYW5kX2NzKCkKPj4+PiAgICAgICB8LS0+IHNwaV9jbGFpbV9idXMo
KQo+Pj4+ICAgICAgIHwgICAgICAgfC0tPiBzcGlfc2V0X3NwZWVkX21vZGUoc3BlZWQgYW5kIG1v
ZGUgZnJvbSBEVCkKPj4+PiAgICAgICAuLi4KPj4+PiAgICAgICB8LS0+IHNwaV9zZXRfc3BlZWRf
bW9kZShkZWZhdWx0IHNwZWVkIGFuZCBtb2RlIHZhbHVlKQo+Pj4+Cj4+Pj4gVGhlIGZpcnN0IHNw
aV9zZXRfc3BlZWRfbW9kZSgpIGNhbGwgaXMgZG9uZSB3aXRoIHNwZWVkIGFuZCBtb2RlCj4+Pj4g
dmFsdWVzIGZyb20gRFQsIHdoZXJlYXMgdGhlIHNlY29uZCBjYWxsIGlzIGRvbmUgd2l0aCBzcGVl
ZAo+Pj4+IGFuZCBtb2RlIHNldCB0byBkZWZhdWx0IHZhbHVlIChzcGVlZCBpcyBzZXQgdG8gQ09O
RklHX1NGX0RFRkFVTFRfU1BFRUQpCj4+Pj4KPj4+PiBUaGlzIGlzIGFuIGlzc3VlIGJlY2F1c2Ug
U1BJIGZsYXNoIHBlcmZvcm1hbmNlIGFyZSBpbXBhY3RlZCBieQo+Pj4+IHVzaW5nIGRlZmF1bHQg
c3BlZWQgd2hpY2ggY2FuIGJlIGxvd2VyIHRoYW4gdGhlIG9uZSBkZWZpbmVkIGluIERULgo+Pj4+
Cj4+Pj4gT25lIHNvbHV0aW9uIGlzIHRvIHNldCBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCB0byB0
aGUgc3BlZWQgZGVmaW5lZAo+Pj4+IGluIERULCBidXQgd2UgbG9vc2UgZmxleGliaWxpdHkgb2Zm
ZXJlZCBieSBEVC4KPj4+Pgo+Pj4+IEFub3RoZXIgaXNzdWUgY2FuIGJlIGVuY291bnRlcmVkIHdp
dGggMiBTUEkgZmxhc2hlcyB1c2luZyAyIGRpZmZlcmVudAo+Pj4+IHNwZWVkcy4gSW4gdGhpcyBz
cGVjaWZpYyBjYXNlIHVzYWdlIG9mIENPTkZJR19TRl9ERUZBVUxUX1NQRUVEIGlzIG5vdAo+Pj4+
IGZsZXhpYmxlIGNvbXBhcmVkIHRvIGdldCB0aGUgMiBkaWZmZXJlbnQgc3BlZWRzIGZyb20gRFQu
Cj4+Pj4KPj4+PiBCeSBhZGRpbmcgbmV3IHBhcmFtZXRlciAidXNlX2R0IiB0byBzcGlfZmxhc2hf
cHJvYmVfYnVzX2NzKCkgYW5kIHRvCj4+Pj4gc3BpX2dldF9idXNfYW5kX2NzKCksIHRoaXMgYWxs
b3dzIHRvIGZvcmNlIHVzYWdlIG9mIGVpdGhlciBzcGVlZCBhbmQKPj4+PiBtb2RlIGZyb20gRFQg
KHVzZV9kdCA9IHRydWUpIG9yIHRvIHVzZSBzcGVlZCBhbmQgbW9kZSBwYXJhbWV0ZXIgdmFsdWUu
Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFy
ZEBmb3NzLnN0LmNvbT4KPj4+PiBDYzogTWFyZWsgQmVodW4gPG1hcmVrLmJlaHVuQG5pYy5jej4K
Pj4+PiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4gQ2M6
IFZpZ25lc2ggUiA8dmlnbmVzaHJAdGkuY29tPgo+Pj4+IENjOiBKb2UgSGVyc2hiZXJnZXIgPGpv
ZS5oZXJzaGJlcmdlckBuaS5jb20+Cj4+Pj4gQ2M6IFJhbW9uIEZyaWVkIDxyZnJpZWQuZGV2QGdt
YWlsLmNvbT4KPj4+PiBDYzogTHVrYXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgo+Pj4+IENj
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+PiBDYzogV29sZmdhbmcgRGVuayA8d2RA
ZGVueC5kZT4KPj4+PiBDYzogU2ltb24gR2xhc3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4+Pj4gQ2M6
IFN0ZWZhbiBSb2VzZSA8c3JAZGVueC5kZT4KPj4+PiBDYzogIlBhbGkgUm9ow6FyIiA8cGFsaUBr
ZXJuZWwub3JnPgo+Pj4+IENjOiBLb25zdGFudGluIFBvcm90Y2hraW4gPGtvc3RhcEBtYXJ2ZWxs
LmNvbT4KPj4+PiBDYzogSWdhbCBMaWJlcm1hbiA8aWdhbGxAbWFydmVsbC5jb20+Cj4+Pj4gQ2M6
IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+Cj4+Pj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxw
LnlhZGF2QHRpLmNvbT4KPj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2VhbmdhMkBnbWFpbC5jb20+
Cj4+Pj4gQ2M6IEFuamkgSiA8YW5qaS5qYWdhcmxtdWRpQG54cC5jb20+Cj4+Pj4gQ2M6IEJpd2Vu
IExpIDxiaXdlbi5saUBueHAuY29tPgo+Pj4+IENjOiBQcml5YW5rYSBKYWluIDxwcml5YW5rYS5q
YWluQG54cC5jb20+Cj4+Pj4gQ2M6IENoYWl0YW55YSBTYWtpbmFtIDxjaGFpdGFueWEuc2FraW5h
bUBueHAuY29tPgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gIGJvYXJkL0NaLk5JQy90dXJyaXNfbW94L3R1
cnJpc19tb3guYyB8ICAyICstCj4+Pj4gIGNtZC9zZi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrKystCj4+Pj4gIGNtZC9zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCj4+Pj4gIGRyaXZlcnMvbXRkL3NwaS9zZi11Y2xhc3MuYyAgICAgICAgICB8ICA4
ICsrKystLS0tCj4+Pj4gIGRyaXZlcnMvbmV0L2ZtL2ZtLmMgICAgICAgICAgICAgICAgICB8ICA1
ICsrKy0tCj4+Pj4gIGRyaXZlcnMvbmV0L3BmZV9ldGgvcGZlX2Zpcm13YXJlLmMgICB8ICAyICst
Cj4+Pj4gIGRyaXZlcnMvbmV0L3NuaV9uZXRzZWMuYyAgICAgICAgICAgICB8ICAzICsrLQo+Pj4+
ICBkcml2ZXJzL3NwaS9zcGktdWNsYXNzLmMgICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+Pj4+
ICBkcml2ZXJzL3VzYi9nYWRnZXQvbWF4MzQyMF91ZGMuYyAgICAgfCAgMiArLQo+Pj4+ICBlbnYv
c2YuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+Pj4+ICBpbmNsdWRlL3Nw
aS5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKy0tLS0KPj4+PiAgaW5jbHVkZS9z
cGlfZmxhc2guaCAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPj4+PiAgdGVzdC9kbS9zcGkuYyAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKystLS0tLS0tCj4+Pj4gIDEzIGZpbGVz
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+Pj4KPj4+IEkgdGhp
bmsgdGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0IHNob3VsZCB1c2UgYSBzZXBhcmF0ZSBmdW5jdGlv
biBuYW1lCj4+PiBpbnN0ZWFkIG9mIGFkZGluZyBhbiBhcmd1bWVudCwgc2luY2UgaXQgZG9lc24n
dCBtYWtlIHNlbnNlIHRvIHBhc3MKPj4+IHBhcmFtZXRlcnMgdGhhdCBhcmUgaWdub3JlZC4KPj4K
Pj4gSSBhbSBjb25mdXNlZCwgZG8geW91IG1lYW4gZHVwbGljYXRlIHNwaV9mbGFzaF9wcm9iZV9i
dXNfY3MoKSBpbiBhbm90aGVyIGZ1bmN0aW9uIHNwaV9mbGFzaF9wcm9iZV9idXNfY3NfZGVmYXVs
dCgpCj4+IGZvciBleGFtcGxlID8KPj4gSW4gdGhlIGZvcm1lciBzcGlfZ2V0X2J1c19hbmRfY3Mo
KSB3aWxsIGJlIGNhbGxlZCB3aXRoICJ1c2VfZHQiIHBhcmFtIHNldCB0byB0cnVlIGFuZCBpbiB0
aGUgbGF0dGVyCj4+ICJ1c2VfZHQiIHBhcmFtIHdpbGwgYmUgc2V0IHRvIGZhbHNlID8KPj4KPj4g
c3BpX2ZsYXNoX3Byb2JlX2J1c19jcygpICAgICAgICAgPT4gc3BpX2dldF9idXNfYW5kX2NzKC4u
LCB0cnVlICwgLi4uKQo+PiBzcGlfZmxhc2hfcHJvYmVfYnVzX2NzX2RlZmF1bHQoKSA9PiBzcGlf
Z2V0X2J1c19hbmRfY3MoLi4sIGZhbHNlLCAuLi4pCj4gCj4gTWF5YmUgcmVuYW1lIHNwaV9nZXRf
YnVzX2FuZF9jcygpIHRvIF9zcGlfZ2V0X2J1c19hbmRfY3MoKSA/Cj4gCj4gSXQgc2VlbXMgdG8g
bWUgdGhhdCBpZiB1c2VfZHQgaXMgcHJvdmlkZWQsIHdlIHNob3VsZCBhY3R1YWxseSBiZSB1c2lu
Zwo+IERUIGFuZCBub3QgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIGF0IGFsbC4gV2Ugc2hvdWxkIGp1
c3QgYmUgYWJsZSB0bwo+IHByb2JlIHRoZSBkZXZpY2UgYW5kIHRoZSByaWdodCB0aGluZ3Mgc2hv
dWxkIGhhcHBlbi4KPiAKPiBJZiB3ZSBtdXN0IHVzZSB0aGUgYnVzIGFuZCBjcyBudW1iZXJzLCBh
bmQgdXNlX2R0IGlzIHRydWUsIHRoZW4gd2UKPiBzaG91bGQgbm90IG5lZWQgdG8gc3BlY2lmeSB0
aGUgbW9kZSwgc3BlZWQsIGV0Yy4gU28gdGhlIGFyZ3MgdG8gdGhhdAo+IGZ1bmN0aW9uIHNob3Vs
ZCBiZSBkaWZmZXJlbnQuCj4gCj4gU28gSSBiZWxpZXZlIHRoZSB0d28gZnVuY3Rpb25zIHNob3Vs
ZCBoYXZlIHF1aXRlIGRpZmZlcmVudCBhcmdzLgo+IFBlcmhhcHMgdGhlIGNvcmUgcGFydCBvZiBz
cGlfZ2V0X2J1c19hbmRfY3MoKSBjb3VsZCBiZSBzcGxpdCBvdXQ/IEkKPiBqdXN0IGZlZWwgdGhl
cmUgYXJlIHdheSB0b28gbWFueSBhcmd1bWVudHMgYW5kIGFkZGluZyBhbiBhcmd1bWVudCB0aGF0
Cj4gY2FuY2VscyBvdXQgc29tZSBvZiB0aGUgb3RoZXJzIGp1c3QgbWFrZXMgYSBjb25mdXNpbmcg
bWVzcy4KClRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbiwgaSB1bmRlcnN0YW5kIG5vdyB3aGF0IHlv
dSBleHBlY3QuCgo+IAo+Pgo+PiBUaGFua3MKPj4gUGF0cmljZQo+Pj4KPj4+IEFsc28gd2Ugc2hv
dWxkIHByb2JhYmx5IGhhdmUgZGV2aWNldHJlZSBhcyB0aGUgZGVmYXVsdCAodGhlIGJhc2UgZnVu
Y3Rpb24gbmFtZSkuCj4+Pgo+IAo+IFNlZSB0aGF0IGFsc28gXgoKWW91IG1lYW4gdGhhdCBzcGlf
Z2V0X2J1c19hbmRfY3MoKSB3aWxsIGltcGx5IHVzaW5nIGRldmljZSB0cmVlIGJ5IGRlZmF1bHQg
PyAKClBhdHJpY2UKCj4gCj4gUmVnYXJkcywKPiBTaW1vbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
