Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D170C1C860F
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 11:48:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B8A6C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 May 2020 09:48:37 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E683C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 09:48:35 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49HpYl5rZ8z1qsZy;
 Thu,  7 May 2020 11:48:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49HpYl17pzz1qspq;
 Thu,  7 May 2020 11:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bRMkb16xLOO8; Thu,  7 May 2020 11:48:21 +0200 (CEST)
X-Auth-Info: XtdENeF0MZ52rZJqBtQzurTS/xLp6XqPDgMqSsyBB3g=
Received: from [192.168.1.106] (91-82-169-45.pool.digikabel.hu [91.82.169.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  7 May 2020 11:48:21 +0200 (CEST)
To: Michal Simek <michal.simek@xilinx.com>
References: <f5214e0dd5f7a2c713f18d75727cc112d2d5e88b.1588593276.git.michal.simek@xilinx.com>
 <e519e51b-d05e-949e-343c-3cb4e606d3c4@denx.de>
 <637580f3-0042-ded2-173b-c9bddd92c588@xilinx.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <7536840e-feb2-07d1-0a48-e7d8771f4e3e@denx.de>
Date: Thu, 7 May 2020 11:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <637580f3-0042-ded2-173b-c9bddd92c588@xilinx.com>
Content-Language: en-US
Cc: Joel Johnson <mrjoel@lixil.net>,
 Hannes Schmelzer <hannes.schmelzer@br-automation.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 =?UTF-8?Q?Eric_B=c3=a9nard?= <eric@eukrea.com>,
 Ken Lin <Ken.Lin@advantech.com.tw>, uboot-stm32@st-md-mailman.stormreply.com,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ian Ray <ian.ray@ge.com>,
 Thomas Hebb <tommyhebb@gmail.com>,
 Alex Nemirovsky <alex.nemirovsky@cortina-access.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Anatolij Gustschin <agust@denx.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Tetsuyuki Kobayashi <koba@kmckk.co.jp>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Otavio Salvador <otavio@ossystems.com.br>, Thomas Weber <weber@corscience.de>,
 Tim Harvey <tharvey@gateworks.com>,
 Troy Kisky <troy.kisky@boundarydevices.com>, git@xilinx.com,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>,
 Akshay Bhat <akshaybhat@timesys.com>, Adam Ford <aford173@gmail.com>,
 Ludwig Zenz <lzenz@dh-electronics.de>, Andreas Dannenberg <dannenberg@ti.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, u-boot@lists.denx.de,
 Simon Glass <sjg@chromium.org>, Holger Brunck <holger.brunck@ch.abb.com>,
 Mario Six <mario.six@gdsys.cc>,
 Masakazu Mochizuki <masakazu.mochizuki.wd@hitachi.com>
Subject: Re: [Uboot-stm32] [PATCH] cmd: mem: Remove
	CONFIG_SYS_MEMTEST_SCRATCH mapping
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gTWljaGFsLAoKQW0gMDcuMDUuMjAyMCB1bSAwODozOSBzY2hyaWViIE1pY2hhbCBTaW1l
azoKPiBPbiAwNy4gMDUuIDIwIDU6MzMsIEhlaWtvIFNjaG9jaGVyIHdyb3RlOgo+PiBIZWxsbyBN
aWNoYWwsCj4+Cj4+IEFtIDA0LjA1LjIwMjAgdW0gMTM6NTQgc2NocmllYiBNaWNoYWwgU2ltZWs6
Cj4+PiBUaGVyZSBpcyBubyByZWFsIG5lZWQgdG8gZXhhY3RseSBkZWZpbmUgc3BhY2UgZm9yIHNh
dmluZyBwYXR0ZXJucyBmb3IKPj4+IGFsdGVybmF0ZSBtZW1vcnkgdGVzdC4gSXQgaXMgbXVjaCBl
YXNpZXIgdG8gYWxsb2NhdGUgc3BhY2Ugb24gdGhlCj4+PiBzdGFjayBhbmQKPj4+IHVzZSBpdCBp
bnN0ZWFkIG9mIHRyeWluZyB0byBmaW5kIG91dCBzcGFjZSB3aGVyZSBwYXR0ZXJuIHNob3VsZCBi
ZSBzYXZlZC4KPj4+Cj4+PiBGb3IgZXhhbXBsZSBpZiB5b3Ugd2FudCB0byB0ZXN0IHRoZSB3aG9s
ZSBERFIgbWVtb3J5IHlvdSBjYW4ndCBzYXZlCj4+PiBwYXR0ZXIKPj4+IHRvIEREUiBhbmQgeW91
IG5lZWQgdG8gZmluZCBpdCBvdXQuIE9uIFhpbGlueCBkZXZpY2VzIEREUiBvciBPQ00KPj4+IGFk
ZHJlc3Nlcwo+Pj4gd2VyZSBjaG9zZW4gYnV0IHRoYXQgbWVhbnMgdGhhdCBPQ00gbmVlZHMgdG8g
YmUgbWFwcGVkIGFuZCBVLUJvb3QgaGFzCj4+PiBhY2Nlc3MgcGVybWlzc2lvbiB0aGVyZS4KPj4+
Cj4+PiBJdCBpcyBlYXNpZXIgdG8gcmVtb3ZlIHRoaXMgbGltaXRhdGlvbiBhbmQgc2ltcGx5IHNh
dmUgaXQgb24gc3RhY2sKPj4+IGJlY2F1c2UKPj4+IGl0IGlzIHZlcnkgY2xlYXIgdGhhdCBtZW1v
cnkgdGVzdCBjYW4ndCByZXdyaXRlIFUtQm9vdCBhbmQgVS1Cb290IGhhcwo+Pj4gYWxzbwo+Pj4g
ZnVsbCBhY2Nlc3MgdG8gbWVtb3J5IHdoZXJlIHJ1bnMgZnJvbS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBNaWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPgo+Pj4gLS0tCj4+Pgo+
Pj4gIMKgIFJFQURNRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IDQgLS0tLQo+Pj4gIMKgIGNtZC9tZW0uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDkgKystLS0tLS0tCj4+
PiAgwqAgaW5jbHVkZS9jb25maWdzL01pZ29SLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDEgLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy9hZHZhbnRlY2hfZG1zLWJhMTYuaCB8IDEgLQo+
Pj4gIMKgIGluY2x1ZGUvY29uZmlncy9hcGFsaXNfaW14Ni5owqDCoMKgwqDCoMKgwqAgfCAxIC0K
Pj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MvYXJpc3RhaW5ldG9zMi5owqDCoMKgwqDCoCB8IDEgLQo+
Pj4gIMKgIGluY2x1ZGUvY29uZmlncy9hcm1hZGlsbG8tODAwZXZhLmjCoMKgIHwgMSAtCj4+PiAg
wqAgaW5jbHVkZS9jb25maWdzL2JsYW5jaGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0K
Pj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MvY2d0cW14NmV2YWwuaMKgwqDCoMKgwqDCoMKgIHwgMSAt
Cj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL2NvbGlicmlfaW14Ni5owqDCoMKgwqDCoMKgIHwgMSAt
Cj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL2RoX2lteDYuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MvZWw2eF9jb21tb24uaMKgwqDCoMKgwqDCoMKg
IHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL2VtYmVzdG14NmJvYXJkcy5owqDCoMKgIHwg
MSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL2dlX2J4NTB2My5owqDCoMKgwqDCoMKgwqDCoMKg
IHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL2d3X3ZlbnRhbmEuaMKgwqDCoMKgwqDCoMKg
wqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MvaW14Nl9sb2dpYy5owqDCoMKgwqDCoMKg
wqDCoCB8IDEgLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy9rem05Zy5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MvbXg2c2FicmVfY29tbW9u
LmjCoMKgwqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3Mvbml0cm9nZW42eC5owqDCoMKg
wqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy9wcmVzaWRpb19hc2ljLmjC
oMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL3NoNzc1MmV2Yi5owqDCoMKg
wqDCoMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL3NoNzc1M2V2Yi5owqDC
oMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL3NoNzc1N2xjci5o
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdzL3N0bTMybXAx
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy90YW8z
NTMwLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25maWdz
L3RyaWNvcmRlci5owqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+PiAgwqAgaW5jbHVkZS9jb25m
aWdzL3hpbGlueF92ZXJzYWwuaMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZp
Z3MveGlsaW54X3ZlcnNhbF9taW5pLmggfCAxIC0KPj4+ICDCoCBpbmNsdWRlL2NvbmZpZ3MveGls
aW54X3p5bnFtcC5owqDCoMKgwqDCoCB8IDQgLS0tLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy94
aWxpbnhfenlucW1wX21pbmkuaCB8IDEgLQo+Pj4gIMKgIGluY2x1ZGUvY29uZmlncy94aWxpbnhf
enlucW1wX3I1LmjCoMKgIHwgMSAtCj4+PiAgwqAgc2NyaXB0cy9jb25maWdfd2hpdGVsaXN0LnR4
dMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCAzMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQo+Pgo+PiBIbW0uLiBJIHRoaW5rIHRoaXMgaXMgZnJv
bSBvbGQgcG93ZXJwYyB0aW1lcywgYnV0IEkgZG8gbm90IHNlZSBhCj4+IHBvd2VycGMgYm9hcmQg
aW4gdGhlIGxpc3QsIHNvIHRoaXMgbWFrZXMgc2Vuc2UuCj4gCj4gQW5kIHdhcyB0aGVyZSBhbnkg
cmVhc29uIHRvIHNldHVwIHNwZWNpZmljIGFkZHJlc3Mgb24gUFBDIGZvciBzYXZpbmcKPiB0ZXN0
IHBhdHRlcm4/CgpOb3QgdGhhdCBJIGFtIGF3YXJlIG9mIGFueW1vcmUuLi4KCmJ5ZSwKSGVpa28K
LS0gCkRFTlggU29mdHdhcmUgRW5naW5lZXJpbmcgR21iSCwgICAgICBNYW5hZ2luZyBEaXJlY3Rv
cjogV29sZmdhbmcgRGVuawpIUkIgMTY1MjM1IE11bmljaCwgT2ZmaWNlOiBLaXJjaGVuc3RyLjUs
IEQtODIxOTQgR3JvZWJlbnplbGwsIEdlcm1hbnkKUGhvbmU6ICs0OS04MTQyLTY2OTg5LTUyICAg
RmF4OiArNDktODE0Mi02Njk4OS04MCAgIEVtYWlsOiBoc0BkZW54LmRlCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlz
dApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
