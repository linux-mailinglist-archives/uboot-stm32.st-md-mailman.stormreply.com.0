Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D07A12C2A
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jan 2025 21:01:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E4E4C78F74;
	Wed, 15 Jan 2025 20:01:36 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C56C2C78F6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 20:01:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 972F8108882FB; Wed, 15 Jan 2025 21:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1736971288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DXAmOFJ7fEXXBRSn3nEbV5c02Zd8GbqAcYkcqa3OYo0=;
 b=Llz475jwlCMZ5gVr63KIq01G28WZAv9CdnEgMCU1uctSbWuu2SCBVqrnAql/Y0YFTM6StG
 g1TX6cmGgmB4gZBhwZvk6gnqCZk7c2fkZ2LUkXQdkCkjsDVnJ302HkO5hx0wdsVTouAA14
 uMy5J7dAMPZxnMu/iio48qc9nM9BtaI7MnIN3TRuGWUY/eG1J593zk5KlEUxplT7dk+YgC
 nhoN2tiW12eM9q/tmrDndA8KFB3+SkfVeEwccF3WZClauREvS1OEvytt/4lxy8j63Zgd6I
 An3qduePySQEsbC/HiVpn85vTvv/X0UzPKSZEWi8pr+JCns46gcfMHsIEhFi1g==
Message-ID: <21b58bc6-df13-4639-86e8-8f44c6439e5d@denx.de>
Date: Wed, 15 Jan 2025 20:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20250114144528.1612168-1-patrice.chotard@foss.st.com>
 <20250114144528.1612168-7-patrice.chotard@foss.st.com>
 <de9e66e1-ab5a-4d46-9ec9-b19627f4ea9b@denx.de>
 <cbb93a24-4b4e-4254-b031-39c1abfa67ba@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <cbb93a24-4b4e-4254-b031-39c1abfa67ba@foss.st.com>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sjoerd Simons <sjoerd@collabora.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 06/10] dw3-generic: Add dependencies whith
 SYSCON and REGMAP
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

T24gMS8xNS8yNSAxMTo0MyBBTSwgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDEv
MTQvMjUgMTU6NTQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxLzE0LzI1IDM6NDUgUE0sIFBh
dHJpY2UgQ2hvdGFyZCB3cm90ZToKPj4+IFNpbmNlIGFkZGl0aW9uIG9mIFNUaUg0MDcgc3VwcG9y
dCBpbiBkd2MzLWdlbmVyaWMsIFNZU0NPTiBhbmQgUkVHTUFQCj4+PiBzdXBwb3J0IGFyZSBuZWVk
ZWQuCj4+Pgo+Pj4gQWRkIGRlcGVuZGVuY2llcyB3aXRoIFNQTF9SRUdNQVAgYW5kIFNQTF9TWVND
T04gZm9yOgo+Pj4gcWNtNjQ5MCwgaW14OG1wX2V2aywgcGh5Y29yZS1pbXg4bXAsIGxpYnJlbTUs
IHFjb20sCj4+PiB4aWxpbnhfdmVyc2FsX25ldF92aXJ0LCBhbWRfdmVyc2FsMl92aXJ0LCB4aWxp
bnhfenlucW1wX2tyaWEKPj4+IHhpbGlueF96eW5xbXBfdmlydC4KPj4+Cj4+PiBBZGQgZGVwZW5k
ZW5jaWVzIHdpdGggU1BMX1JFR01BUCBhbmQgU1BMX1NZU0NPTiBmb3IgYW01N3h4X2hzX2V2bV91
c2IuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3Rh
cmRAZm9zcy5zdC5jb20+Cj4+PiBDYzogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+PiAt
LS0KPj4+Cj4+PiAgwqAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnIHwgNCArKysrCj4+PiAgwqAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL0tjb25maWcgYi9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcKPj4+IGluZGV4
IDAxMDA3MjNhNjhiLi5lZjgyYTNlOTYyNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3
YzMvS2NvbmZpZwo+Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnCj4+PiBAQCAtMjYs
NiArMjYsMTAgQEAgY29uZmlnIFVTQl9EV0MzX09NQVAKPj4+ICDCoCBjb25maWcgVVNCX0RXQzNf
R0VORVJJQwo+Pj4gIMKgwqDCoMKgwqAgYm9vbCAiR2VuZXJpYyBpbXBsZW1lbnRhdGlvbiBvZiBh
IERXQzMgd3JhcHBlciAoYWthIGR3YzMgZ2x1ZSkiCj4+PiAgwqDCoMKgwqDCoCBkZXBlbmRzIG9u
IERNX1VTQiAmJiBVU0JfRFdDMyAmJiBNSVNDCj4+PiArwqDCoMKgIHNlbGVjdCBTUExfUkVHTUFQ
IGlmIFNQTAo+Pj4gK8KgwqDCoCBzZWxlY3QgU1BMX1NZU0NPTiBpZiBTUEwKPj4+ICvCoMKgwqAg
c2VsZWN0IFJFR01BUAo+Pj4gK8KgwqDCoCBzZWxlY3QgU1lTQ09OCj4+IFdoeSB3YXMgdGhpcyBu
b3QgbmVlZGVkIHNvIGZhciA/IE9yIGlzIHRoaXMgYSBidWdmaXggPwo+IAo+IE15IGNvbW1lbnQg
bGFja3Mgb2YgZGV0YWlsLgo+IEJ5IGFkZGluZyBzdGloNDA3IHN1cHBvcnQsIGkgYW0gdXNpbmcg
c3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIHdoaWNoCj4gbmVlZCB0aGF0IFJFR01B
UCBhbmQgU1lTQ09uIHN1cHBvcnQgYXJlIGVuYWJsZWQuCkkgc3VzcGVjdCB0aGlzIHdpbGwgbm93
IGJlIHNwZWNpZmljIHRvIHRoZSBzdGloIGdsdWUgZHJpdmVyICwgcmlnaHQ/Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcg
bGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
