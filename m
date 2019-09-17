Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E570B5763
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 23:12:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A50EC36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 21:12:45 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1247C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1568754754;
 bh=ezzBLN3iBp8JI2wGQaJRIkBvDaqlr0b0+nYNdPUM8GE=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=GqW+a8mpH3jdM0ZQoMAy8UV6eOCE/9nohQAix779XC6rpSyWgBVnYvv1j1VQmqF7Q
 9zxYEjQIKQcQl0pbpC7Q9qk0LTH4FAnar3kwEx66yr6CdJ8t//kfm9iCbNaF4igWFz
 CMPQK+9dttQa/SvFsQUXBnd01ColtI+2K9Zp4t/g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.51] ([88.152.145.122]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0Lj1Cw-1hf75o1ZXC-00dCD8; Tue, 17
 Sep 2019 23:12:34 +0200
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
References: <1568368083-11075-1-git-send-email-yannick.fertre@st.com>
 <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <4f087ff2-1abc-9783-354f-6febedae556c@gmx.de>
Date: Tue, 17 Sep 2019 23:12:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568368083-11075-2-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:c4JrIofokKnE7KBlydaNv6zutkllWSMY8id5hRt9twko7hhuYBr
 y7w/CmmdtxTwfryM1+unUloGH+eme05g9xxqGw+kqVpFdeVsORgCivdSsTM24ylNz4PcqNj
 jigG2hTvvlzp6YOPJvjAKaIHoMmwS/HOK9rhEZGMvMZmCQgIXImBZVlOnLjbml6MV3wuCeP
 NmtYLlkbgkFKbklt1IXmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s5NzmPG+bZE=:5o3o81PKJgBpW7IELm7EjY
 r7xtmGwxTiIquG5XUP3St6VGfEu5UVZQx6g43TuyhG7PJ/x7OZJrpqcuxixuBvERXf8QoDfaa
 5YLhxAeM99xW+2mUMbSAJmi0VNPVN4pl21N8LUoXP07BodAfro9KRsXbNkvQ60IQ8G6Pr3b/W
 p0sCUxKWbgONrG1VEaz9aCLOdUxJkKi7yykXTtVN705swcbeoUjosfJk9SpomujO4KOecvTAI
 u67UflYo+iM+ieMR3U55lQWaFKsjNBgPIYnopF9JUsl86lWaw0WYjNVmN58ti2zh7oUR1LiF2
 ZnSwT+XqvrAs66COSNFDproj2Ji2fPT2JI1E00O6O7V4mHVg/3OowwGERcslfQpFAyRey7F1a
 NabRsfVLpksmPugVf/Uu3Ne7dnBJWw425YAj82o2vETYWFqNRjCH0kEjtGbx0PShOahGdPxo2
 RRWynK2DJAsC+TYOkDMKezbaQ2dk3NfSbXPBcSyuu0GeGje0n9SH8jAUKmGR80Y6ngTWd/6pE
 idgGkuicErt2o0OmcncUxXbxMWNwpP4noNnCSdIs2qyETxRAiryNTbdGdNtubqVkdIgb7wDOP
 uxUFLcSnHI6q6uvbMFI/KwkBEMzULLastfHWZXu2TlliRgTMcfdD9bp3c3YVB4weiUtj+p6sE
 udCe3c0r0kZl5DTIOqdph9GXqSi7BMUE2maH5GwKt4y+G83m6C/Mt2UyDUdG+hxogCDzNeZE/
 Kr+KbR3whQvPlpSGtKA1JzkXNwOfbfr5mqydDXZA9WVdiSUYz9gy4AwT+NhxjYiXS4xt3v4UB
 L+v8/6sKgc6GezPT7TG2YoQdzuWAz5OZFqlhyFfgiz4DFLUZFCnJCdkFfYHLVFjlkSpYrzn+e
 buQezGFoqLdCP1py/bbyHWfi5m+aY9tsV4j2sr3gBOFOreKDlOpsSe7JeWsJwMyWv5ef0gI6o
 hfr8CLK2/iHgC/CnNLnSVxLcBeXCCJkPO6w4+RyItHKJjaI9ZWRIfAjwzxsLmFQmyft7ided7
 Wy9mqnbxS2hbM7CY+hmJkBjFssrftoyHFtZTeDIx1KwoeV81UQcvMWmfKIkcXfqSx0+0Fxi44
 jRuM6Trc9OntjtGLz+iU/GuUbLUHEmWSjGYCEEeRghdEO0sejSp7iqgwQLf5TexERmOLEQoYu
 iiCRqmfs1BWyjfxj05gTqtc7Yw0xRXxN6SjLJvBPgmctjkrtDik4VRvOwuT407PJuxaZpB5tq
 oq6tdUVh9Pq0vxSu1Jl5s1VmmhfNpOvE0BLS3z1RSFLJdi9DrEaDlYttDZzg=
Subject: Re: [Uboot-stm32] [PATCH v4 01/15] video: bmp: check resolutions of
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

T24gOS8xMy8xOSAxMTo0NyBBTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+IElmIHRoZSBzaXpl
IG9mIHRoZSBiaXRtYXAgaXMgYmlnZ2VyIHRoYW4gdGhlIHNpemUgb2YKPiB0aGUgcGFuZWwgdGhl
biBlcnJvcnMgYXBwZWFyIHdoZW4gY2FsY3VsYXRpbmcgYXhpcyBhbGlnbm1lbnQKPiBhbmQgdGhl
IGNvcHkgb2YgYml0bWFwIGlzIGRvbmUgb3V0c2lkZSBvZiBmcmFtZWJ1ZmZlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy92aWRlby92aWRlb19ibXAuYyB8IDE0ICsrKysrKysrKysrKysrCj4gICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vdmlkZW9fYm1wLmMgYi9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCj4gaW5kZXggMTkzZjM3
ZC4uNTQ0YmQ1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL3ZpZGVvX2JtcC5jCj4gKysr
IGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYwo+IEBAIC01NCw2ICs1NCwxMyBAQCBzdGF0aWMg
dm9pZCB2aWRlb19kaXNwbGF5X3JsZThfYml0bWFwKHN0cnVjdCB1ZGV2aWNlICpkZXYsCj4gICAJ
aGVpZ2h0ID0gZ2V0X3VuYWxpZ25lZF9sZTMyKCZibXAtPmhlYWRlci5oZWlnaHQpOwo+ICAgCWJt
YXAgPSAodWNoYXIgKilibXAgKyBnZXRfdW5hbGlnbmVkX2xlMzIoJmJtcC0+aGVhZGVyLmRhdGFf
b2Zmc2V0KTsKPgo+ICsJLyogY2hlY2sgaWYgcGljdHVyZSBzaXplIGV4Y2VlZCBwYW5lbCBzaXpl
ICovCgolcy9leGNlZWQvZXhjZWVkcy8KCj4gKwlpZiAocHJpdi0+eHNpemUgPCB3aWR0aCkKPiAr
CQl3aWR0aCA9IHByaXYtPnhzaXplOwoKSW4gY2FzZSBvZiBCTVBfUkxFOF9ERUxUQSB3aWR0aCBp
cyBub3QgY2hlY2tlZCBiZWZvcmUgd3JpdGluZyB0byB0aGUKZnJhbWUgYnVmZmVyLiBTbyB0aGlz
IG1vZGlmaWNhdGlvbiBvZiB3aWR0aCB3aWxsIGxlYWQgdG8gdW5leHBlY3RlZCBlZmZlY3RzLgoK
SW4gdGhlICdkZWZhdWx0JyBjYXNlIHdpZHRoIGlzIGNoZWNrZWQgYW5kIHRoaXMgbWF5IGxlYWQg
dG8gZGVjb2RpbmcgZXJyb3JzLgoKPiArCj4gKwlpZiAocHJpdi0+eXNpemUgPCBoZWlnaHQpCj4g
KwkJaGVpZ2h0ID0gcHJpdi0+eXNpemU7Cj4gKwo+ICAgCXggPSAwOwo+ICAgCXkgPSBoZWlnaHQg
LSAxOwo+Cj4gQEAgLTI0OSw2ICsyNTYsMTMgQEAgaW50IHZpZGVvX2JtcF9kaXNwbGF5KHN0cnVj
dCB1ZGV2aWNlICpkZXYsIHVsb25nIGJtcF9pbWFnZSwgaW50IHgsIGludCB5LAo+Cj4gICAJcGFk
ZGVkX3dpZHRoID0gKHdpZHRoICYgMHgzID8gKHdpZHRoICYgfjB4MykgKyA0IDogd2lkdGgpOwo+
Cj4gKwkvKiBjaGVjayBpZiBwaWN0dXJlIHNpemUgZXhjZWVkIHBhbmVsIHNpemUgKi8KPiArCWlm
IChwd2lkdGggPCB3aWR0aCkKPiArCQl3aWR0aCA9IHB3aWR0aDsKPiArCj4gKwlpZiAocHJpdi0+
eXNpemUgPCBoZWlnaHQpCj4gKwkJaGVpZ2h0ID0gcHJpdi0+eXNpemU7Cj4gKwoKWW91IGZvcmdv
dCB0byBjb25zaWRlciB0aGUgcG9zaXRpb24gKHgseSkgb2YgdGhlIHBpY3R1cmUuCgpCZXN0IHJl
Z2FyZHMKCkhlaW5yaWNoCgo+ICAgCWlmIChhbGlnbikgewo+ICAgCQl2aWRlb19zcGxhc2hfYWxp
Z25fYXhpcygmeCwgcHJpdi0+eHNpemUsIHdpZHRoKTsKPiAgIAkJdmlkZW9fc3BsYXNoX2FsaWdu
X2F4aXMoJnksIHByaXYtPnlzaXplLCBoZWlnaHQpOwo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
