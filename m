Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1C93E92E
	for <lists+uboot-stm32@lfdr.de>; Sun, 28 Jul 2024 22:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E77CC6DD96;
	Sun, 28 Jul 2024 20:08:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82246C6DD66
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Jul 2024 20:08:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 111CC841BC;
 Sun, 28 Jul 2024 22:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1722197312;
 bh=M8SOmneL0ou17T8Wxxz4W2dcTHrvs2gZ6XSpfWjq7J4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B0Ha5Enyef3ySQi2BFJg6r5Wmy8JV3eOOcSdZ7UPkNSi/G1JaNzbMiepY0BRH15UI
 Ag31d+ndbOA8Dp7zT+R2MefBPyS8BlRSu9AnuB3+CVsNjwgNeoX8RfQL9FyyheNmdB
 eiwk1NL6hdQv/gcfJJmqxtR8I4Yh5v9VI9Z38efWQNk4N8WC4kJxPD/9AfU85R+wbk
 x/lu496nKKmxk5vDeaeoch/nH2YGjEAG3pmtiADmSW5aeS+O0NXilhEdQ5sfALTOC3
 QE1QeV82QoC6Fa4Oh77sGJtewPcCDhuDBegUfmwuz1uA1nGC4EiXlZ0OcpPVYZnLhd
 yAoNmjtaB76Zw==
Message-ID: <18d84528-d2e5-41d6-ae1d-109ee30853b2@denx.de>
Date: Sun, 28 Jul 2024 22:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Svyatoslav <clamor95@gmail.com>
References: <20240626235717.272219-1-marex@denx.de>
 <a73dffe5-87e3-4e96-965f-9d029f2af8ed@denx.de>
 <CAPVz0n0C6TPdBRUEvJmgAUGAKoetuzr1j=0cMXweP2EqMTwn=g@mail.gmail.com>
 <0910419d-e8ab-4bf9-a083-dc2783afaca1@denx.de>
 <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4D07A6E5-F156-44C3-A26D-0F2D913CE92D@gmail.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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

T24gNy8yOC8yNCA5OjAyIFBNLCBTdnlhdG9zbGF2IHdyb3RlOgoKSGksCgpJJ20gdHJpbW1pbmcg
dGhlIENDIGJlY2F1c2UgSSBrZWVwIGdldHRpbmcgTUwgYmxvY2thZ2UgZHVlIHRvIGxhcmdlIEND
IApsaXN0LiBJZiBzb21lb25lIGhhcyBiZWVuIHJlbW92ZWQgdG9vIGhhc3RpbHksIHNvcnJ5LgoK
PiAyOCDQu9C40L/QvdGPIDIwMjTigK/RgC4gMjE6MzU6MjcgR01UKzAzOjAwLCBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4g0L3QsNC/0LjRgdCw0LIoLdC70LApOgo+PiBPbiA3LzI4LzI0IDc6
NTUgUE0sIFN2eWF0b3NsYXYgUnloZWwgd3JvdGU6Cj4+PiDQvdC0LCAyOCDQu9C40L8uIDIwMjTi
gK/RgC4g0L4gMTk6MzggTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+INC/0LjRiNC1Ogo+Pj4+
Cj4+Pj4gT24gNi8yNy8yNCAxOjU1IEFNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+Pj4gSW4gY2Fz
ZSBhIHJlZ3VsYXRvciBEVCBub2RlIGNvbnRhaW5zIHJlZ3VsYXRvci1hbHdheXMtb24gb3IgcmVn
dWxhdG9yLWJvb3Qtb24KPj4+Pj4gcHJvcGVydHksIG1ha2Ugc3VyZSB0aGUgcmVndWxhdG9yIGdl
dHMgY29ycmVjdGx5IGNvbmZpZ3VyZWQgYnkgVS1Cb290IG9uIHN0YXJ0Cj4+Pj4+IHVwLiBVbmNv
bmRpdGlvbmFsbHkgcHJvYmUgc3VjaCByZWd1bGF0b3IgZHJpdmVycy4gVGhpcyBpcyBhIHByZXBh
cmF0b3J5IHBhdGNoCj4+Pj4+IGZvciBpbnRyb2R1Y3Rpb24gb2YgLnJlZ3VsYXRvcl9wb3N0X3By
b2JlKCkgd2hpY2ggd291bGQgdHJpZ2dlciB0aGUgcmVndWxhdG9yCj4+Pj4+IGNvbmZpZ3VyYXRp
b24uCj4+Pj4+Cj4+Pj4+IFBhcnNpbmcgb2YgcmVndWxhdG9yLWFsd2F5cy1vbiBhbmQgcmVndWxh
dG9yLWJvb3Qtb24gRFQgcHJvcGVydHkgaGFzIGJlZW4KPj4+Pj4gbW92ZWQgdG8gcmVndWxhdG9y
X3Bvc3RfYmluZCgpIGFzIHRoZSBpbmZvcm1hdGlvbiBpcyByZXF1aXJlZCBlYXJseSwgdGhlCj4+
Pj4+IHJlc3Qgb2YgdGhlIERUIHBhcnNpbmcgaGFzIGJlZW4ga2VwdCBpbiByZWd1bGF0b3JfcHJl
X3Byb2JlKCkgdG8gYXZvaWQKPj4+Pj4gc2xvd2luZyBkb3duIHRoZSBib290IHByb2Nlc3MuCj4+
Pj4KPj4+PiBJcyB0aGVyZSBhbnl0aGluZyBibG9ja2luZyB0aGlzIHNlcmllcyBmcm9tIGJlaW5n
IGFwcGxpZWQgPwo+Pj4KPj4+IFRoaXMgcGF0Y2hzZXQgY2F1c2VzIFBNSUMgcmVndWxhdG9ycyBw
cm9iZSB0b28gZWFybHkgd2hpY2ggcmVzdWx0cyBpbgo+Pj4gaTJjIGxpbmUgc2V0dXAgZmFpbHVy
ZS4gVGhlc2UgcGF0Y2hlcyBNVVNUIE5PVCBiZSBhcHBsaWVkIGluIHRoaXMgZm9ybQo+Pj4gc2lu
Y2UgdGhleSB3aWxsIGJyZWFrIGF0IGxlYXN0IDE1IFRlZ3JhIDMgZGV2aWNlcyB3aGljaCB1c2Ug
RE0gUE1JQywKPj4+IG1heWJlIG1vcmUuCj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGVzdGluZy4gSSBk
byBub3QgaGF2ZSBhbnkgdGVncmEgMyBkZXZpY2VzLCBidXQgdGhpcyBwYXRjaHNldCBkb2VzIG5v
dCBkbyBhbnl0aGluZyB3aXRoIHBpbm11eGluZy4gSWYgYSByZWd1bGF0b3IgaXMgcHJvYmVkLCBh
bGwgb2YgaXRzIGRlcGVuZGVuY2llcyAoaTJjIGJ1cywgcGlubXV4IGNvbmZpZ3VyYXRpb24sIGV0
Yy4pIHNob3VsZCBiZSBwcm9iZWQgYXMgd2VsbC4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB3aGF0
IHRoZSBwcm9ibGVtIHdpdGggcGlubXV4aW5nIGlzIG9uIHRlZ3JhIDM/IEl0IHNlZW1zIGl0IG1p
Z2h0IGJlIHVucmVsYXRlZCB0byB0aGlzIHBhdGNoc2V0IGFuZCB3b3VsZCBldmVudHVhbGx5IHNo
b3cgdXAgZWxzZXdoZXJlPwo+IAo+IFBpbm11eD8gV2R5bSwgSSB3cm90ZSBhYm91dCBhIFBNSUMg
d2hpY2ggaXMgdXN1YWxseSBsb2NhdGVkIG9uIGkyYyBsaW5lLgo+IAo+IDxodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMzEwMDMwNjIxMjYuNDIwMjYt
NC1jbGFtb3I5NUBnbWFpbC5jb20vPgo+IAo+IFRoaXMgaXMgYSBzaW1pbGFyIHBhdGNoLgo+IAo+
IFlvdSBtYXkgYmUgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIEkgZmFjZSBpZiB5b3UgaGF2
ZSBhIGRldmljZSB3aGljaCB1c2VzIFNQTCBhbmQgaGFzIERNIFBNSUMgd2l0aCByZWd1bGF0b3Jz
IHRoYXQgbmVlZCBhbHdheXMtb24vYm9vdC1vbiBwcm9wZXJ0aWVzLgoKSSBhY3R1YWxseSBkbyB1
c2U6Cgpjb25maWdzL2lteDhtcF9kaGNvbV9wZGszX2RlZmNvbmZpZzpDT05GSUdfRE1fUE1JQz15
CmNvbmZpZ3MvaW14OG1wX2RoY29tX3BkazNfZGVmY29uZmlnOkNPTkZJR19ETV9QTUlDX1BDQTk0
NTA9eQpjb25maWdzL2lteDhtcF9kaGNvbV9wZGszX2RlZmNvbmZpZzpDT05GSUdfU1BMX0RNX1BN
SUNfUENBOTQ1MD15Cgp3aGljaCBpcyBvbmUgb2YgdGhlIGRldmljZXMgSSB0ZXN0IHRoaXMgb24u
CgpUaGUgUE1JQyBpcyBvbiBJMkMsIERNX1BNSUMgZW5hYmxlZCBpbiBTUEwsIGJvdGggYnVjazQg
YW5kIGJ1Y2s1IApyZWd1bGF0b3JzIGFyZSBlbmFibGVkIGluIFNQTCwgaGF2ZSByZWd1bGF0b3It
YWx3YXlzLW9uIGFuZCAKcmVndWxhdG9yLWJvb3Qtb24gYW5kIGJvb3RwaC1wcmUtcmFtIHByb3Bl
cnRpZXMuCgpUaGlzIHNlZW1zIHNpbWlsYXIgZW5vdWdoLCByaWdodCA/CgpXaGF0IGlzIHRoZSBw
cm9ibGVtIHlvdSBvYnNlcnZlIG9uIHRlZ3JhIDMgPwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
