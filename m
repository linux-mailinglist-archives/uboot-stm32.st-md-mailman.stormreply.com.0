Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3F1A44D4
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 11:58:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6312C36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 09:58:27 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DB1DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 09:58:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48zD3h4cLbz1rrKb;
 Fri, 10 Apr 2020 11:58:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48zD3h3QHnz1r0bb;
 Fri, 10 Apr 2020 11:58:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id iw1-wntgL0Kb; Fri, 10 Apr 2020 11:58:22 +0200 (CEST)
X-Auth-Info: tngI7wmL1Kria/bqF8Hisx+cqvELcT+SQd+8yPABY48=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 10 Apr 2020 11:58:22 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
References: <20200403102815.1.I64599059b66bacb531db38c67273754a145dbad8@changeid>
 <20200403102815.2.Ib6abcb05422a74bc6bc03daa71b15c98c99dbc5d@changeid>
 <ea5a59e9-dd9f-f2b6-a210-d99b417cb8f2@denx.de>
 <faf4ef59ca6a49c7a8a032726468fe43@SFHDAG6NODE3.st.com>
 <6e789fd398524ffbbdd6122278d72564@SFHDAG6NODE3.st.com>
 <0dda916f-0573-6f02-a774-cc4e463759e4@denx.de>
 <af7aab29c615462ca2e6190fc524736a@SFHDAG6NODE3.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <d18709c2-c349-ef50-0124-2a99750ece5e@denx.de>
Date: Fri, 10 Apr 2020 10:13:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <af7aab29c615462ca2e6190fc524736a@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: Tom Rini <trini@konsulko.com>,
 Vladimir Olovyannikov <vladimir.olovyannikov@broadcom.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Rajesh Ravi <rajesh.ravi@broadcom.com>,
 Simon Glass <sjg@chromium.org>, Alexey Brodkin <abrodkin@synopsys.com>,
 Trevor Woerner <trevor@toganlabs.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/3] arm: caches: add DCACHE_DEFAULT_OPTION
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

T24gNC85LzIwIDg6MDYgUE0sIFBhdHJpY2sgREVMQVVOQVkgd3JvdGU6Cj4gRGVhciBNYXJlaywK
CkhpLAoKPj4gU2VudDogamV1ZGkgOSBhdnJpbCAyMDIwIDEyOjIxCj4+IFRvOiBQYXRyaWNrIERF
TEFVTkFZIDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT47IHUtYm9vdEBsaXN0cy5kZW54LmRlCj4+
Cj4+IE9uIDQvOS8yMCAxMjowMSBQTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4+IERlYXIg
TWFyZWssCj4+Cj4+IEhpLAo+Pgo+Pj4+IEZyb206IFVib290LXN0bTMyIDx1Ym9vdC1zdG0zMi1i
b3VuY2VzQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20+Cj4+Pj4gT24gQmVoYWxmIE9mIFBh
dHJpY2sgREVMQVVOQVkKPj4+Pgo+Pj4+IERlYXIgTWFyZWssCj4+Pj4KPj4+Pj4gRnJvbTogTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4+IFNlbnQ6IHZlbmRyZWRpIDMgYXZyaWwgMjAy
MCAyMzoyOQo+Pj4+Pgo+Pj4+PiBPbiA0LzMvMjAgMTA6MjggQU0sIFBhdHJpY2sgRGVsYXVuYXkg
d3JvdGU6Cj4+Pj4+PiBBZGQgdGhlIG5ldyBmbGFncyBEQ0FDSEVfREVGQVVMVF9PUFRJT04gdG8g
ZGVmaW5lIHRoZSBkZWZhdWx0Cj4+Pj4+PiBvcHRpb24gdG8gdXNlIGFjY29yZGluZyB0aGUgY29t
cGlsYXRpb24gZmxhZ3MKPj4+Pj4+IENPTkZJR19TWVNfQVJNX0NBQ0hFX1dSSVRFVEhST1VHSCBv
cgo+Pj4+PiBDT05GSUdfU1lTX0FSTV9DQUNIRV9XUklURUFMTE9DLgo+Pj4+Pgo+Pj4+PiBDYW4n
dCB5b3UgdW5pZnkgdGhlc2UgbWFjcm9zIGludG8gYSBzaW5nbGUgS2NvbmZpZyAic2VsZWN0Igo+
Pj4+PiBzdGF0ZW1lbnQgaW5zdGVhZCAsIGFuZCB0aGVuIGp1c3Qgc2VsZWN0IHRoZSBtYXRjaGlu
ZyBjYWNoZSBjb25maWd1cmF0aW9uIGluCj4+IEtjb25maWcgPwo+Pj4+Cj4+Pj4gWWVzIEkgd2ls
bCB0cnksIHdpdGggMiBzdGVwcwo+Pj4+IC0gbWlncmF0ZSBleGlzdGluZyBDT05GSUdfU1lTX0FS
TV9DQUNIRV8uLi4uIGluIEtjb25maWcKPj4+Cj4+PiBGaXJzdCBzdGVwIGRvbmUuLi4KPj4+IEkg
d2lsbCBwdXNoIGl0IGFzIGEgc2VwYXJhdGUgcGF0Y2hzZXQgSSB0aGluay4KPj4+Cj4+Pj4gLSBh
ZGQgbmV3IG9wdGlvbiBDT05GSUdfU1lTX0FSTV9DQUNIRV9PUFRJT04KPj4+Cj4+PiBJbiBmYWN0
IGl0IGlzIHRvIGRpZmZpY3VsdCB0byB1c2Ugc2VsZWN0IGJlY2F1c2UgZWFjaCBkZWZpbmVzCj4+
PiBEQ0FDSEVfWFhYIHZhbHVlIGNhbiBoYXZlIHNldmVyYWwgdmFsdWVzCj4+Pgo+Pj4gdGhleSBh
cmUgYnVpbGQgYWNjb3JkaW5nIENPTkZJR19BUk02NCAvIExQQUUKPj4+Cj4+PiBCdXQsIEkgY2Fu
J3QgdXNlIHRoaXMgZGVmaW5lIGluIEtjb25maWcKPj4+Cj4+PiBJIHRyeSA6Cj4+PiBvcHRpb24J
QVJNX09QVElPTgo+Pj4gCWludCAib3B0aW9uIgo+Pj4gCWRlZmF1bHQgRENBQ0hFX1dSSVRFVEhS
T1VHSFQgaWYKPj4gQ09ORklHX1NZU19BUk1fQ0FDSEVfV1JJVEVUSFJPVUdICj4+PiAJZGVmYXVs
dCBEQ0FDSEVfIFdSSVRFQUxMT0MgaWYgQ09ORklHX1NZU19BUk1fQ0FDSEVfCj4+IFdSSVRFQUxM
T0MKPj4+IAlkZWZhdWx0IERDQUNIRV9XUklURUJBQ0sgaWYKPj4gQ09ORklHX1NZU19BUk1fQ0FD
SEVfV1JJVEVCQUNLCj4+Pgo+Pj4gaW50IGFuZCBoZXggaXMgaW52YWxpZCwgYW5kIHN0cmluZyBj
YW4ndCBiZSB1c2Ugd2l0aCAiIi4KPj4+Cj4+PiBBbmQgSSBkb24ndCBmb3VuZCB3YXkgdG8gYnVp
bGQgaXQgYXV0b21hdGljYWxseSB3aGVuIG9wdGlvbiBpcyBhY3RpdmF0ZWQuCj4+Pgo+Pj4gQW55
IGlkZWEgPwo+Pgo+PiBNYXliZSB5b3UgY2FuIGhhdmUgYSBzZWxlY3QgaW4gdGhlIEtjb25maWcg
dG8gc2V0IHNvbWUgZGlmZmVyZW50bHkgbmFtZWQgb3B0aW9uLAo+PiBlLmcuCj4+Cj4+IERDQUNI
RV9NT0RFX1dSSVRFe1RIUk9VR0gsQUxMT0MsQkFDS30KPj4KPj4gYW5kIHRoZW4gYW4gaWZkZWYg
aW4gc29tZSBoZWFkZXIgZmlsZSwgZS5nLgo+Pgo+PiAjaWZkZWYgQ09ORklHX0RDQUNIRV9NT0RF
X1dSSVRFVEhST1VHSAo+PiAjZGVmaW5lIEFSTV9DQUNIRV9NT0RFIERDQUNIRV9XUklURVRIUk9V
R0ggLi4uCj4+Cj4+IEFuZCB0aGVuIHVzZSBBUk1fQ0FDSEVfTU9ERSB3aGVyZSB5b3UgbmVlZCBh
IHZhbHVlIGFuZAo+PiBDT05GSUdfRENBQ0hFX01PREV7Li4ufSB3aGVyZSB5b3UgbmVlZCBhIGNv
bmZpZyBvcHRpb24gY2hlY2suCj4+Cj4+IERvZXMgdGhpcyB3b3JrID8KPiAKPiBJIHRyeSB3aXRo
IHN0cmluZyBhbmQgZGVmYXVsdCAoYXMgc2VsZWN0IGlzIGFsbG93ZWQgb24gZm9yIGJvbGVhbiBv
ciB0cmlzYXRlKSwKPiBBbmQgSSBmYWlsZWQgOi08Cj4gCj4gSSBkb24ndCBmb3VuZCBhIHdheSB0
byBoYXZlIHRoZSBkZS1zdHJpbmdmaWNhdGUgdGhlIEtDb25maWcgb3B0aW9uCj4gdG8gZ2VuZXJh
dGVkIHRoZSBjb3JyZWN0IGRlZmluZQoKVGhlIHJlc3VsdCBpcyBhIGJvb2xlYW4gLCBpc24ndCBp
dCA/IE9uZSBvdXQgb2YgTiBjb25maWdzIGVuZHMgdXAgYmVpbmcKZGVmaW5lZCBhbmQgdGhlIHJl
c3QgYXJlIG5vdCBkZWZpbmVkLgoKPiBjb25maWcgU1lTX0FSTV9DQUNIRV9QT0xJQ1kKPiAJc3Ry
aW5nICJOYW1lIG9mIHRoZSBBUk0gZGF0YSB3cml0ZSBjYWNoZSBwb2xpY3kiCj4gCWRlZmF1bHQg
V1JJVEVCQUNLIGlmIFNZU19BUk1fQ0FDSEVfV1JJVEVCQUNLCj4gCWRlZmF1bHQgV1JJVEVUSFJP
VUdIIGlmIFNZU19BUk1fQ0FDSEVfV1JJVEVCQUNLCj4gCWRlZmF1bHQgV1JJVEVBTExPQyBpZiBT
WVNfQVJNX0NBQ0hFX1dSSVRFQUxMT0MKPiAKPiAjZGVmaW5lIERDQUNIRV9ERUZBVUxUX09QVElP
TglEQ0FDSEVfICMjIENPTkZJR19TWVNfQVJNX0NBQ0hFX1BPTElDWQo+IAo+ID0+IGVycm9yOiDi
gJhEQ0FDSEVfQ09ORklHX1NZU19BUk1fQ0FDSEVfUE9MSUNZ4oCZIHVuZGVjbGFyZWQgKGZpcnN0
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmENPTkZJR19TWVNfQVJNX0NB
Q0hFX1BPTElDWeKAmT8KPiAKPiAjZGVmaW5lIERDQUNIRV9PUFRJT04ocykJRENBQ0hFXyAjIyBD
T05GSUdfU1lTX0FSTV9DQUNIRV9QT0xJQ1kKPiAKPiAjZGVmaW5lIERDQUNIRV9ERUZBVUxUX09Q
VElPTglEQ0FDSEVfT1BUSU9OKENPTkZJR19TWVNfQVJNX0NBQ0hFX1BPTElDWSkKPiAKPiBhcmNo
L2FybS9pbmNsdWRlL2FzbS9zeXN0ZW0uaDo0ODg6MjY6IGVycm9yOiDigJhEQ0FDSEVf4oCZIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmERD
QUNIRV9PRkbigJk/Cj4gYXJjaC9hcm0vbGliL2NhY2hlLWNwMTUuYzo5OToyNTogZXJyb3I6IGV4
cGVjdGVkIOKAmCnigJkgYmVmb3JlIHN0cmluZyBjb25zdGFudAo+IAo+IFRoZSBzdHJpbmdpZmlj
YXRpb24gaXMgcG9zc2libGUgYnV0IG5vdCB0aGUgaW52ZXJzZSBvcGVyYXRpb24gKHJlbW92ZSB0
aGUgcXVvdGUpLi4uCj4gCj4gSW4gbXkgLmNvbmZpZywgQ09ORklHX1NZU19BUk1fQ0FDSEVfUE9M
SUNZPSJXUklURUJBQ0siCgpXaGF0IGFib3V0IHRoaXM6CgpjaG9pY2UKcHJvbXB0ICJDYWNoZSBw
b2xpY3kiCiBkZWZhdWx0IENBQ0hFX1dSSVRFQkFDSwoKY29uZmlnIENBQ0hFX1dSSVRFQkFDSwog
Ym9vbCAiV3JpdGViYWNrIgoKY29uZmlnIC4uLgoKZW5kY2hvaWNlCgphbmQgdGhlbiBpbiBzb21l
IGhlYWRlcgoKI2lmZGVmIENPTkZJR19DQUNIRV9XUklURUJBQ0sKI2RlZmluZSBDT05GSUZfU1lT
X0FSTV9DQUNIRV9XUklURUJBQ0sKI2Vsc2UKLi4uCgpXb3VsZCB0aGF0IHdvcmsgPwoKQnV0IEkg
ZmVlbCBJIG1pZ2h0IHJlYWxseSBiZSBtaXNzaW5nIHRoZSBxdWVzdGlvbiBoZXJlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWls
aW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0z
Mgo=
