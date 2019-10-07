Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A47CEABC
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 19:34:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8494BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 17:34:43 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2D80C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1570469672;
 bh=F9vXC+/v0pAUi7Qdoc1tp12iT+QTH9on/RqTZhf2kls=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=Rd2e7psGuVpJvcNAnNfax2JPCNSAweO78m+rdQMjRyvNQmDgV7V9Hm0aU2Wv5so9h
 3Z/6YB0vGNZoYY2fHpBKKyHsMOnHNO5/3WL7gP7cCj3NK9os9P/C2UKVxPk6ikC4WQ
 EDSfpeM7bQo7QEqjCxTo4KbP2o5mZeqZ+82lJ1Gw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([84.118.154.222]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1ps8-1iFL2e2mca-002E1Q; Mon, 07
 Oct 2019 19:34:32 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 Vikas Manocha <vikas.manocha@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Patrice Chotard
 <patrice.chotard@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
References: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
 <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <2d9bb18b-5775-00b6-2fdd-1b38dce1abcc@gmx.de>
Date: Mon, 7 Oct 2019 19:34:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570454955-21298-2-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:0JOIiXXskuU2f8phCABOTOvFP+h4K4ZccwIA1Gqy/vbeE6Sp05E
 +Z3I8tpE3g5lIgWJKyxuBFPDkshXSG64iC+bV1Re+jz5WXdLaMMJUoEctWUcXbpFkmPVwMn
 Nl3ZDg8QQCbVDBU35PkBkA8r9Ip9NPFaVAvUZ7JQCRgKd4sxnWgTfDeVhZ1bMRFu2Iq3FLP
 5uKbgnSgjYaxcK7v9amHw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qGgGFWuHy58=:fpUe3c4WXvRNnpqA48da2x
 hwMDUvzIu7bSnfAwkiI0qYsgbbG0OUGt+uknfMCmTWXJ80b3NIqw9zVcuz6kFvkxx/QOIJnDN
 +AxjRGb6QrU2o761dbbLojtFEBo8mfBc/XUMBO5e9cguJJ0f3+2bkeQytAr5ktz7XbFPmyIgR
 hFkUjqRAZB8Sz9pDAwVSLyunquGbydCq8Vz89Hc9n9GDvIVqksgqF0pyqHhTa4OoYD6ZDau84
 Fk1rI6kr7TYcZ8/kGD7Zc68aAj6fOhUH88WBKlhURlkuEP6xYfdRtqQP7sPXFE9PFakCKWyz7
 YMp8vSLEexVGgAgPRxUkT0HpdvBLvjfOk9ubJtynrxG8kEt0MDRu+RmaTSGqzbbVQ8yJk1HWM
 SRqRoKm74eh0LXBf6TOIOAZy3CFJMvmBWkp8Cqi/3adcrnMg0W8rZ+2h24ztW/PzfzHqdBFD9
 3n2A3lD44Rln8Q63gXgj0jsCMH3KHSTyEkuwGXmXXjcKkcmLCt5Z2cgDxhUd7iHYSBSfPDfUf
 QyENYNxny0lqjI+EUxc3CLbxzI8J5qajzPoaBlxG/UFrYstzfpk+A9zUMtvDaeRHMvK2ch15r
 1Bx9ehID62l8b8mtAHpZO8cZPxsch+ZQN8aAOpTWleeUmK0kSh4Q2OSL7o5bvEH/y0VwrwYxk
 1WIQzxVP5X4j+D0gkJEU3ny7k9JxTz7o6pwPJ4eph5nrLxWF2hQRZr/rcmbrItt9cQmImCfse
 NOY66xyXHvUzOZjW9b6HHhP8MSmh/oiJmcKKd7c4Px7WsXdIAYsznJ7BNGgIMeZokxAXIFnhr
 THc4AqbmTkRqVjsTEcMrqjR8ycukSNzrcxd2E3iHYKVI4WFDAuyQnmd/Y6Nwl9J20uKVRxMCp
 cXSQ9Jnw90PVUKFdrcJLFWmCAS39MXiTR6r9tDqfpc9/yPNbtAhbPltAh3TqV/NlXMTxGQOp2
 +Or3TVeQNAHxTXLdcGRZO/2drG0WNgXTXeSWv9BKuzqrJUhreK4B/Og0Otkwr3mTx3zxl8VSR
 H0GyIyNU+6yeK42gfSf2m1gAXQCSySDLvjMSffq8l5rgjwFJmvzqdo0FR/q1Gj4PN9ymsLtjb
 1dO5kwX39u2R1flX1lsJK5s4uVS6/LNEvCx+wz+VC+IqdnrZXPfQM1NaFu1KR9OKx9IHgewC4
 esmSgNlNHE/dVkgSlXMN2wY02J+swt+Hj7EkvBxrDDox9gcDnkbFMLChy6zeIrhaDOgM6gP3K
 As56diTgkRr6rnOB/E4hUZXOZVLML0sG2AdhTRH8xZwn1q623AoJbhT/e0RY=
Subject: Re: [Uboot-stm32] [PATCH v5 01/15] video: bmp: check resolutions of
	panel/bitmap
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

T24gMTAvNy8xOSAzOjI5IFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4gSWYgdGhlIHNpemUg
b2YgdGhlIGJpdG1hcCBpcyBiaWdnZXIgdGhhbiB0aGUgc2l6ZSBvZgo+IHRoZSBwYW5lbCB0aGVu
IGVycm9ycyBhcHBlYXIgd2hlbiBjYWxjdWxhdGluZyBheGlzIGFsaWdubWVudAo+IGFuZCB0aGUg
Y29weSBvZiBiaXRtYXAgaXMgZG9uZSBvdXRzaWRlIG9mIGZyYW1lYnVmZmVyLgo+Cj4gU2lnbmVk
LW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+Cj4gLS0tCj4g
ICBkcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jIHwgNyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby92aWRlb19i
bXAuYyBiL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMKPiBpbmRleCAxOTNmMzdkLi40YWYxZmI0
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL3ZpZGVvX2JtcC5jCj4gQEAgLTI0OSw2ICsyNDksMTMgQEAgaW50IHZpZGVvX2JtcF9k
aXNwbGF5KHN0cnVjdCB1ZGV2aWNlICpkZXYsIHVsb25nIGJtcF9pbWFnZSwgaW50IHgsIGludCB5
LAo+Cj4gICAJcGFkZGVkX3dpZHRoID0gKHdpZHRoICYgMHgzID8gKHdpZHRoICYgfjB4MykgKyA0
IDogd2lkdGgpOwo+Cj4gKwkvKiBjaGVjayBpZiBwaWN0dXJlIHNpemUgZXhjZWVkcyBwYW5lbCBz
aXplICovCj4gKwlpZiAoKHB3aWR0aCA8IHdpZHRoKSB8fCAocHJpdi0+eXNpemUgPCBoZWlnaHQp
KSB7Cj4gKwkJcHJpbnRmKCJFcnJvcjogQk1QIHNpemUgJWQgeCAlZCBpcyBiaWdnZXIgdGhhbiBw
YW5lbCBzaXplICVkIHggJWRcbiIsCj4gKwkJICAgICAgIChpbnQpd2lkdGgsIChpbnQpaGVpZ2h0
LCBwcml2LT54c2l6ZSwgcHJpdi0+eXNpemUpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+
ICsKPiAgIAlpZiAoYWxpZ24pIHsKPiAgIAkJdmlkZW9fc3BsYXNoX2FsaWduX2F4aXMoJngsIHBy
aXYtPnhzaXplLCB3aWR0aCk7Cj4gICAJCXZpZGVvX3NwbGFzaF9hbGlnbl9heGlzKCZ5LCBwcml2
LT55c2l6ZSwgaGVpZ2h0KTsKClRoaXMgaXMgZm9sbG93ZWQgYnk6CgogwqDCoMKgwqDCoMKgwqAg
aWYgKCh4ICsgd2lkdGgpID4gcHdpZHRoKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB3aWR0aCA9IHB3aWR0aCAtIHg7CiDCoMKgwqDCoMKgwqDCoMKgaWYgKCh5ICsgaGVpZ2h0KSA+
IHByaXYtPnlzaXplKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBoZWlnaHQgPSBw
cml2LT55c2l6ZSAtIHk7CgpUaGVzZSBsaW5lcyB3aWxsIGNsaXAgYSBiaXRtYXAgdGhhdCBnaXZl
biB0aGUgbGVmdCB1cHBlciBjb3JuZXIgeCwgeQpkb2VzIG5vdCBmaXQgb250byB0aGUgc2NyZWVu
LgoKU28gaXNuJ3QgdGhpcyBwYXRjaCBzdXBlcmZsdW91cz8KCldoYXQgaXMgbWlzc2luZyBhcmUg
Y2hlY2tzIGZvciB4IGFuZCB5LgoKRm9yIHRlc3RpbmcgSSBoYXZlIHVzZWQgcWVtdV94ODYgYW5k
IGFkZGVkCgogICAgICNkZWZpbmUgQ09ORklHX0JNUF8yNEJQUCB5Cgp0byB0aGUgdG9wIG9mIGRy
aXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgYW5kIGxvYWRlZCBhIDI0Yml0IGJpdG1hcC4KCkNsaXBw
aW5nIHdvcmtzIGFzIGV4cGVjdGVkLiBCdXQgcGFzc2luZyBhIHZhbHVlIG9mIHggZXhjZWVkaW5n
IHRoZQpzY3JlZW4gd2lkdGggbGVhZCB0byBhIGNyYXNoLgoKV2hhdCBJIHJlYWxseSBkaXNsaWtl
IGluIHRoZSBleGlzdGluZyBjb2RpbmcgaXMgdGhhdCBDT05GSUdfQk1QXypCUFAgaXMKZGVmaW5l
ZCBpbiBpbmNsdWRlcyBpbnN0ZWFkIG9mIHVzaW5nIEtjb25maWcgYnV0IHRoYXQgaXMgYSBkaWZm
ZXJlbnQgc3RvcnkuCgpCZXN0IHJlZ2FyZHMKCkhlaW5yaWNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9v
dC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
