Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CA4A4B96
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 17:14:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA5A5C5E2C6;
	Mon, 31 Jan 2022 16:14:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED19AC0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 16:14:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VEY4hx021764;
 Mon, 31 Jan 2022 17:14:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=j1BZs/9Q9BSndzE7MdZWp+aduhkyCw4oOfvZAiSF4zY=;
 b=zOG9Eif+6FFCFIBG6kTibp7yBCS/AVHghBVESM5kLLNVKv18FlSbkdTc04LQ7OOkTdtM
 Ap8eupTG4Mv57GJp0Gm9QJ+WNv33nkyfcLQRLsGNWBCd3DyhH7mDcJZG9jHpaYbrF3Ps
 GudPAezPzFw4OcfJtZWux68VwyHtwzlsvb08PJ3VZBbg1PXiJv8rTkzzN/BCuMRDFVTq
 isBtoplVa3apCgpOOgy53LniHUXa21pnd3dnCrk413muiqUq6QSq2hegbaVoJ0d5bGGz
 rP7QGTd+8agkCsYqmc0uupPP2WTaD0LmCF+IcNrtZLQtOxq3lkqsuY/HZEBuWgz0S9Uz uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dx0pybycy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:14:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9792510002A;
 Mon, 31 Jan 2022 17:14:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 781A5222C8E;
 Mon, 31 Jan 2022 17:14:18 +0100 (CET)
Received: from [10.201.21.201] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan
 2022 17:14:15 +0100
Message-ID: <e4b1c0a9-2dac-f7b7-6a63-a83b6a515566@foss.st.com>
Date: Mon, 31 Jan 2022 17:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20220112105908.7388-1-patrice.chotard@foss.st.com>
 <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <CAPnjgZ0rq==OQPJHgfdd_2q58dH2Z+O_E0+KhnD4Ykk9FSLfmg@mail.gmail.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
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

SGkgU2ltb24KCk9uIDEvMjEvMjIgMTY6MjAsIFNpbW9uIEdsYXNzIHdyb3RlOgo+IEhpIFBhdHJp
Y2UsCj4gCj4gT24gV2VkLCAxMiBKYW4gMjAyMiBhdCAwMzo1OSwgUGF0cmljZSBDaG90YXJkCj4g
PHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEFkZCBzcGlfZmxhc2hf
cHJvYmVfYnVzX2NzKCkgYW5kIHNwaV9nZXRfYnVzX2FuZF9jcygpIG5ldyAidXNlX2R0Igo+PiBw
YXJhbSB3aGljaCBhbGxvd3MgdG8gc2VsZWN0IFNQSSBzcGVlZCBhbmQgbW9kZSBmcm9tIERUIG9y
IGZyb20KPj4gZGVmYXVsdCB2YWx1ZSBwYXNzZWQgaW4gcGFyYW1ldGVycy4KPj4KPj4gU2luY2Ug
Y29tbWl0IGUyZTk1ZTVlMjU0MiAoInNwaTogVXBkYXRlIHNwZWVkL21vZGUgb24gY2hhbmdlIikK
Pj4gd2hlbiBjYWxsaW5nICJzZiBwcm9iZSIgb3IgImVudiBzYXZlIiBvbiBTUEkgZmxhc2gsCj4+
IHNwaV9zZXRfc3BlZWRfbW9kZSgpIGlzIGNhbGxlZCB0d2ljZS4KPj4KPj4gc3BpX2dldF9idXNf
YW5kX2NzKCkKPj4gICAgICAgfC0tPiBzcGlfY2xhaW1fYnVzKCkKPj4gICAgICAgfCAgICAgICB8
LS0+IHNwaV9zZXRfc3BlZWRfbW9kZShzcGVlZCBhbmQgbW9kZSBmcm9tIERUKQo+PiAgICAgICAu
Li4KPj4gICAgICAgfC0tPiBzcGlfc2V0X3NwZWVkX21vZGUoZGVmYXVsdCBzcGVlZCBhbmQgbW9k
ZSB2YWx1ZSkKPj4KPj4gVGhlIGZpcnN0IHNwaV9zZXRfc3BlZWRfbW9kZSgpIGNhbGwgaXMgZG9u
ZSB3aXRoIHNwZWVkIGFuZCBtb2RlCj4+IHZhbHVlcyBmcm9tIERULCB3aGVyZWFzIHRoZSBzZWNv
bmQgY2FsbCBpcyBkb25lIHdpdGggc3BlZWQKPj4gYW5kIG1vZGUgc2V0IHRvIGRlZmF1bHQgdmFs
dWUgKHNwZWVkIGlzIHNldCB0byBDT05GSUdfU0ZfREVGQVVMVF9TUEVFRCkKPj4KPj4gVGhpcyBp
cyBhbiBpc3N1ZSBiZWNhdXNlIFNQSSBmbGFzaCBwZXJmb3JtYW5jZSBhcmUgaW1wYWN0ZWQgYnkK
Pj4gdXNpbmcgZGVmYXVsdCBzcGVlZCB3aGljaCBjYW4gYmUgbG93ZXIgdGhhbiB0aGUgb25lIGRl
ZmluZWQgaW4gRFQuCj4+Cj4+IE9uZSBzb2x1dGlvbiBpcyB0byBzZXQgQ09ORklHX1NGX0RFRkFV
TFRfU1BFRUQgdG8gdGhlIHNwZWVkIGRlZmluZWQKPj4gaW4gRFQsIGJ1dCB3ZSBsb29zZSBmbGV4
aWJpbGl0eSBvZmZlcmVkIGJ5IERULgo+Pgo+PiBBbm90aGVyIGlzc3VlIGNhbiBiZSBlbmNvdW50
ZXJlZCB3aXRoIDIgU1BJIGZsYXNoZXMgdXNpbmcgMiBkaWZmZXJlbnQKPj4gc3BlZWRzLiBJbiB0
aGlzIHNwZWNpZmljIGNhc2UgdXNhZ2Ugb2YgQ09ORklHX1NGX0RFRkFVTFRfU1BFRUQgaXMgbm90
Cj4+IGZsZXhpYmxlIGNvbXBhcmVkIHRvIGdldCB0aGUgMiBkaWZmZXJlbnQgc3BlZWRzIGZyb20g
RFQuCj4+Cj4+IEJ5IGFkZGluZyBuZXcgcGFyYW1ldGVyICJ1c2VfZHQiIHRvIHNwaV9mbGFzaF9w
cm9iZV9idXNfY3MoKSBhbmQgdG8KPj4gc3BpX2dldF9idXNfYW5kX2NzKCksIHRoaXMgYWxsb3dz
IHRvIGZvcmNlIHVzYWdlIG9mIGVpdGhlciBzcGVlZCBhbmQKPj4gbW9kZSBmcm9tIERUICh1c2Vf
ZHQgPSB0cnVlKSBvciB0byB1c2Ugc3BlZWQgYW5kIG1vZGUgcGFyYW1ldGVyIHZhbHVlLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPj4gQ2M6IE1hcmVrIEJlaHVuIDxtYXJlay5iZWh1bkBuaWMuY3o+Cj4+IENjOiBKYWdh
biBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPj4gQ2M6IFZpZ25lc2ggUiA8dmln
bmVzaHJAdGkuY29tPgo+PiBDYzogSm9lIEhlcnNoYmVyZ2VyIDxqb2UuaGVyc2hiZXJnZXJAbmku
Y29tPgo+PiBDYzogUmFtb24gRnJpZWQgPHJmcmllZC5kZXZAZ21haWwuY29tPgo+PiBDYzogTHVr
YXN6IE1hamV3c2tpIDxsdWttYUBkZW54LmRlPgo+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRl
bnguZGU+Cj4+IENjOiBXb2xmZ2FuZyBEZW5rIDx3ZEBkZW54LmRlPgo+PiBDYzogU2ltb24gR2xh
c3MgPHNqZ0BjaHJvbWl1bS5vcmc+Cj4+IENjOiBTdGVmYW4gUm9lc2UgPHNyQGRlbnguZGU+Cj4+
IENjOiAiUGFsaSBSb2jDoXIiIDxwYWxpQGtlcm5lbC5vcmc+Cj4+IENjOiBLb25zdGFudGluIFBv
cm90Y2hraW4gPGtvc3RhcEBtYXJ2ZWxsLmNvbT4KPj4gQ2M6IElnYWwgTGliZXJtYW4gPGlnYWxs
QG1hcnZlbGwuY29tPgo+PiBDYzogQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4KPj4gQ2M6
IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KPj4gQ2M6IFNlYW4gQW5kZXJzb24gPHNl
YW5nYTJAZ21haWwuY29tPgo+PiBDYzogQW5qaSBKIDxhbmppLmphZ2FybG11ZGlAbnhwLmNvbT4K
Pj4gQ2M6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPgo+PiBDYzogUHJpeWFua2EgSmFpbiA8
cHJpeWFua2EuamFpbkBueHAuY29tPgo+PiBDYzogQ2hhaXRhbnlhIFNha2luYW0gPGNoYWl0YW55
YS5zYWtpbmFtQG54cC5jb20+Cj4+IC0tLQo+Pgo+PiAgYm9hcmQvQ1ouTklDL3R1cnJpc19tb3gv
dHVycmlzX21veC5jIHwgIDIgKy0KPj4gIGNtZC9zZi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrKystCj4+ICBjbWQvc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+PiAgZHJpdmVycy9tdGQvc3BpL3NmLXVjbGFzcy5jICAgICAgICAgIHwgIDggKysr
Ky0tLS0KPj4gIGRyaXZlcnMvbmV0L2ZtL2ZtLmMgICAgICAgICAgICAgICAgICB8ICA1ICsrKy0t
Cj4+ICBkcml2ZXJzL25ldC9wZmVfZXRoL3BmZV9maXJtd2FyZS5jICAgfCAgMiArLQo+PiAgZHJp
dmVycy9uZXQvc25pX25ldHNlYy5jICAgICAgICAgICAgIHwgIDMgKystCj4+ICBkcml2ZXJzL3Nw
aS9zcGktdWNsYXNzLmMgICAgICAgICAgICAgfCAgOCArKysrLS0tLQo+PiAgZHJpdmVycy91c2Iv
Z2FkZ2V0L21heDM0MjBfdWRjLmMgICAgIHwgIDIgKy0KPj4gIGVudi9zZi5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAyICstCj4+ICBpbmNsdWRlL3NwaS5oICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOSArKysrKy0tLS0KPj4gIGluY2x1ZGUvc3BpX2ZsYXNoLmggICAgICAgICAg
ICAgICAgICB8ICAyICstCj4+ICB0ZXN0L2RtL3NwaS5jICAgICAgICAgICAgICAgICAgICAgICAg
fCAxNSArKysrKysrKy0tLS0tLS0KPj4gIDEzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMo
KyksIDI5IGRlbGV0aW9ucygtKQo+IAo+IEkgdGhpbmsgdGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0
IHNob3VsZCB1c2UgYSBzZXBhcmF0ZSBmdW5jdGlvbiBuYW1lCj4gaW5zdGVhZCBvZiBhZGRpbmcg
YW4gYXJndW1lbnQsIHNpbmNlIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBwYXNzCj4gcGFyYW1l
dGVycyB0aGF0IGFyZSBpZ25vcmVkLgoKSSBhbSBjb25mdXNlZCwgZG8geW91IG1lYW4gZHVwbGlj
YXRlIHNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSBpbiBhbm90aGVyIGZ1bmN0aW9uIHNwaV9mbGFz
aF9wcm9iZV9idXNfY3NfZGVmYXVsdCgpCmZvciBleGFtcGxlID8KSW4gdGhlIGZvcm1lciBzcGlf
Z2V0X2J1c19hbmRfY3MoKSB3aWxsIGJlIGNhbGxlZCB3aXRoICJ1c2VfZHQiIHBhcmFtIHNldCB0
byB0cnVlIGFuZCBpbiB0aGUgbGF0dGVyCiJ1c2VfZHQiIHBhcmFtIHdpbGwgYmUgc2V0IHRvIGZh
bHNlID8KCnNwaV9mbGFzaF9wcm9iZV9idXNfY3MoKSAgICAgICAgID0+IHNwaV9nZXRfYnVzX2Fu
ZF9jcyguLiwgdHJ1ZSAsIC4uLikKc3BpX2ZsYXNoX3Byb2JlX2J1c19jc19kZWZhdWx0KCkgPT4g
c3BpX2dldF9idXNfYW5kX2NzKC4uLCBmYWxzZSwgLi4uKQoKVGhhbmtzClBhdHJpY2UKPiAKPiBB
bHNvIHdlIHNob3VsZCBwcm9iYWJseSBoYXZlIGRldmljZXRyZWUgYXMgdGhlIGRlZmF1bHQgKHRo
ZSBiYXNlIGZ1bmN0aW9uIG5hbWUpLgo+IAo+IFJlZ2FyZHMsCj4gU2ltb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGluZyBs
aXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
