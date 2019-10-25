Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A7E4729
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 11:29:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28934C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Oct 2019 09:29:28 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40946C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2019 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1571995760;
 bh=JDQqa5v419RiF5tiuhE6qJVy7qjgz6XhIHWtvysKisw=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=Ps0s/xyIB5n89jHpZ3/Jviyq22ZtBnNOs/2RMrk8Hw78cjiDcuuTLbS534drp7tX/
 OMp/xvl4UKmoYlBaS3tO9MAi8j1EijHgfzVmlecuXODLRiltJz0VXA7K4fq74do1jh
 m5IBTq1IFisHqFw/olZz/FIZifi34PJAp6XJjvmA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.63] ([94.114.42.168]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1iefXh1Kw9-00Pd5R; Fri, 25
 Oct 2019 11:29:20 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 Vikas Manocha <vikas.manocha@st.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Simon Glass <sjg@chromium.org>,
 Anatolij Gustschin <agust@denx.de>, Patrice Chotard
 <patrice.chotard@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com
References: <1571995309-8069-1-git-send-email-yannick.fertre@st.com>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=xypron.glpk@gmx.de; prefer-encrypt=mutual; keydata=
 mQINBE2g3goBEACaikqtClH8OarLlauqv9d9CPndgghjEmi3vvPZJi4jvgrhmIUKwl7q79wG
 IATxJ1UOXIGgriwoBwoHdooOK33QNy4hkjiNFNrtcaNT7uig+BG0g40AxSwVZ/OLmSFyEioO
 BmRqz1Zdo+AQ5RzHpu49ULlppgdSUYMYote8VPsRcE4Z8My/LLKmd7lvCn1kvcTGcOS1hyUC
 4tMvfuloIehHX3tbcbw5UcQkg4IDh4l8XUc7lt2mdiyJwJoouyqezO3TJpkmkayS3L7o7dB5
 AkUwntyY82tE6BU4quRVF6WJ8GH5gNn4y5m3TMDl135w27IIDd9Hv4Y5ycK5sEL3N+mjaWlk
 2Sf6j1AOy3KNMHusXLgivPO8YKcL9GqtKRENpy7n+qWrvyHA9xV2QQiUDF13z85Sgy4Xi307
 ex0GGrIo54EJXZBvwIDkufRyN9y0Ql7AdPyefOTDsGq5U4XTxh6xfsEXLESMDKQMiVMI74Ec
 cPYL8blzdkQc1MZJccU+zAr6yERkUwo1or14GC2WPGJh0y/Ym9L0FhXVkq9e1gnXjpF3QIJh
 wqVkPm4Two93mAL+929ypFr48OIsN7j1NaNAy6TkteIoNUi09winG0tqU5+U944cBMleRQOa
 dw+zQK0DahH4MGQIU0EVos7lVjFetxPjoKJE9SPl/TCSc+e0RwARAQABtChIZWlucmljaCBT
 Y2h1Y2hhcmR0IDx4eXByb24uZ2xwa0BnbXguZGU+iQI4BBMBAgAiAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAUCVAqnzgAKCRDEgdu8LAUaxP7AD/9Zwx3SnmrLLc3CqEIcOJP3FMrW
 gLNi5flG4A/WD9mnQAX+6DEpY6AxIagz6Yx8sZF7HUcn1ByDyZPBn8lHk1+ZaWNAD0LDScGi
 Ch5nopbJrpFGDSVnMWUNJJBiVZW7reERpzCJy+8dAxhxCQJLgHHAqPaspGtO7XjRBF6oBQZk
 oJlqbBRFkTcgOI8sDsSpnsfSItZptoaqqm+lZpMCrB5s8x7dsuMEFaRR/4bq1efh8lSq3Kbf
 eSY59MWh49zExRgAb0pwON5SE1X9C84T2hx51QDiWW/G/HvJF2vxF8hCS7RSx0fn/EbPWkM6
 m+O1SncMaA43lx1TvRfPmYhxryncIWcez+YbvH/VqoLtxvz3r3OTH/WEA5J7mu5U1m2lUGNC
 cFN1bDsNoGhdlFZvG/LJJlBClWBWYHqHnnGEqEQJrlie9goBcS8YFUcfqKYpdmp5/F03qigY
 PmrE3ndBFnaOlOT7REEi8t3gmxpriTtGpKytFuwXNty1yK2kMiLRnQKWN7WgK70pbFFO4tyB
 vIhDeXhFmx6pyZHlXjsgbV3H4QbqazqxYOQlfHbkRpUJczuyPGosFe5zH+9eFvqDWYw2qdH+
 b0Nt1r12vFC4Mmj5szi40z3rQrt+bFSfhT+wvW9kZuBB5xEFkTTzWSFZbDTUrdPpn2DjYePS
 sEHKTUhgl7kCDQRNoN4KARAA6WWIVTqFecZHTUXeOfeKYugUwysKBOp8E3WTksnv0zDyLS5T
 ImLI3y9XgAFkiGuKxrJRarDbw8AjLn6SCJSQr4JN+zMu0MSJJ+88v5sreQO/KRzkti+GCQBK
 YR5bpqY520C7EkKr77KHvto9MDvPVMKdfyFHDslloLEYY1HxdFPjOuiMs656pKr2d5P4C8+V
 iAeQlUOFlISaenNe9XRDaO4vMdNy65Xrvdbm3cW2OWCx/LDzMI6abR6qCJFAH9aXoat1voAc
 uoZ5F5NSaXul3RxRE9K+oWv4UbXhVD242iPnPMqdml6hAPYiNW0dlF3f68tFSVbpqusMXfiY
 cxkNECkhGwNlh/XcRDdb+AfpVfhYtRseZ0jEYdXLpUbq1SyYxxkDEvquncz2J9urvTyyXwsO
 QCNZ0oV7UFXf/3pTB7sAcCiAiZPycF4KFS4b7gYo9wBROu82B9aYSCQZnJFxX1tlbvvzTgc+
 ecdQZui+LF/VsDPYdj2ggpgxVsZX5JU+5KGDObBZC7ahOi8Jdy0ondqSRwSczGXYzMsnFkDH
 hKGJaxDcUUw4q+QQuzuAIZZ197lnKJJv3Vd4N0zfxrB0krOcMqyMstvjqCnK/Vn4iOHUiBgA
 OmtIhygAsO4TkFwqVwIpC+cj2uw/ptN6EiKWzXOWsLfHkAE+D24WCtVw9r8AEQEAAYkCHwQY
 AQIACQIbDAUCVAqoNwAKCRDEgdu8LAUaxIkbD/wMTA8n8wgthSkPvhTeL13cO5/C3/EbejQU
 IJOS68I2stnC1ty1FyXwAygixxt3GE+3BlBVNN61dVS9SA498iO0ApxPsy4Q7vvQsF7DuJsC
 PdZzP/LZRySUMif3qAmIvom8fkq/BnyHhfyZ4XOl1HMr8pMIf6/eCBdgIvxfdOz79BeBBJzr
 qFlNpxVP8xrHiEjZxU965sNtDSD/1/9w82Wn3VkVisNP2MpUhowyHqdeOv2uoG6sUftmkXZ8
 RMo+PY/iEIFjNXw1ufHDLRaHihWLkXW3+bS7agEkXo0T3u1qlFTI6xn8maR9Z0eUAjxtO6qV
 lGF58XeVhfunbQH8Kn+UlWgqcMJwBYgM69c65Dp2RCV7Tql+vMsuk4MT65+Lwm88Adnn6ppQ
 S2YmNgDtlNem1Sx3JgCvjq1NowW7q3B+28Onyy2fF0Xq6Kyjx7msPj3XtDZQnhknBwA7mqSZ
 DDw0aNy1mlCv6KmJBRENfOIZBFUqXCtODPvO5TcduJV/5XuxbTR/33Zj7ez2uZkOEuTs/pPN
 oKMATC28qfg0qM59YjDrrkdXi/+iDe7qCX93XxdIxpA5YM/ZiqgwziJX8ZOKV7UDV+Ph5KwF
 lTPJMPdQZYXDOt5DjG5l5j0cQWqE05QtYR/V6g8un6V2PqOs9WzaT/RB12YFcaeWlusa8Iqs Eg==
Message-ID: <54286002-aa21-c9dd-de6d-4fc99a5ef1e9@gmx.de>
Date: Fri, 25 Oct 2019 11:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571995309-8069-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Provags-ID: V03:K1:yWUFOr/oZKxdKnT4GhX+GYB4PDOwiVujmG7QaIGwMQffpTPxJP4
 NBL2Pkf16GTGl57zzEVvBThHViNpG5Lt+ASLFj4zKRNw/IeZ+dSiUw3/C81UNXp64z1w4dy
 SAxsDr05fRMbCu9/z2tLaPzUAXd8UiKjS6W6GjhXaYiGjhdLtlytiFL6nqUjpmwAEhUh3gg
 lKZJtBRcf/olEx6eRmp/w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3w55eG+nmyE=:4jLl0kuYC283BfbIu/cjzH
 EYmSUZY7dQZoYaEeqSxgQujRflzQd8HXS8mDWXMlGpKrarQs+Bo93pKFpKCNmVzdTIeTy/Rcu
 83fRSNdnZ9YCqonHmrml2dejYtjh0nxJL42P1SHqJEt9LaiNdBsfLAcNHRXV3klLmQVGOddTm
 4lC761O3twj+CZw42UpwzjuCqHvWoSY23OX4zTuwurSVyOd+0b/9rOokE3BwhHpUvHO07Ahqm
 gPaGaoFHZQXYqMAWvTTRYzj9tc0EvlmzOA3XFgx+3LoHnQpXYA7AlHHyqn+eTPiS/S9ONYdjm
 pvPOfq+zuSb5nw+BKMM+Lh0QCR8cSs37Oat2+m/2u54ttFvSIGi4mpRPJmTsN709bRb+W2Hd2
 Myf3MH72RPS412N+BcW1uzQMGv1p+Ythsspa2CJnFothLUarerDrfX+y+k9zBueLlRUERfBYh
 BojSNp35SxZun7KGtrVeiyOsOdhiODW2g4tFVLrmcG2Fvc646k6VfJPZtXCD8CX6cqYl78rbj
 48GnCFEnrysAQKGYzrnR+jZmF9wpSeMbti1H43IKqPeOsXocrvuAKIynd+YPm2JI1tOQEhyqM
 ChD3azUbmATMtugzu/iJN3Mm8wiPypHGuWZe9qfWee4Zc8jd5Cofo8kD4ewnIQHm2d1zSHXad
 uRL34lfSq5Myxv4dUNh+QrXrNPm08yzQ0wSMg56duyx3FVPX3pmNoHxQIPhQ7b90b3/Sf141V
 vQ7sS/L3M+BqR8C+TMYRFxhfeRapOgzP+blfv84bQnn5ujtAVXMRBpgE+hurkjge9uRzfJWp+
 gjJKFyGUa/wr+sAhabPIZfAJr+8GFSTw7CquTbVNojGbyNm6vDETMEJ6rb6z7YkDYSy/dREnZ
 k9z3MM8P7TfYgNu26XrXAyUdGZKy+gAwvhE3KRLkIUeBZ/P0fp44DEQF+fEH4Rtwq1m/PhALw
 ItdvKRzkKf+pJEBXT1QTnXAPekgvYE/pnORfU4pi8oO89zEUSury6pKCStkrMlp3FURpt8mFv
 19C5nk7b/ePmvsWTYrExq477gW6msRmgunS4HE8XydB+uFYvvUab3RYGHw7CSoaURqC965dld
 Mt5o1YfHToLEUmQ/SCqrEKq8msH9/Z+Co+bJvxbP7APbED0VJNevzjNanDSjAyav9N5SU6SsV
 wvoLxRsNTfP/GgRoshtEdsHD9pX60tAJH5XMUoFMnrhPrZvAF5hT0o7McS6Vab3S3hZwnnarL
 WCI/pdfl4r0YASd8CwSYIe8vwrhdKxmiPDKJV3lC1ujhjKbX2wInZf74KmG4=
Subject: Re: [Uboot-stm32] [PATCH] video: bmp: check coordinates of bitmap
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

T24gMTAvMjUvMTkgMTE6MjEgQU0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiBJZiB0aGUgY29v
cmRpbmF0ZXMgYXJlIGJpZ2dlciB0aGFuIHRoZSBzaXplIG9mCj4gdGhlIHBhbmVsIHRoZW4gZXJy
b3JzIGFwcGVhciB3aGVuIGNhbGN1bGF0aW5nIGF4aXMgYWxpZ25tZW50Cj4gYW5kIHRoZSBjb3B5
IG9mIGJpdG1hcCBpcyBkb25lIG91dHNpZGUgb2YgZnJhbWVidWZmZXIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4KPiAtLS0KPiAgZHJp
dmVycy92aWRlby92aWRlb19ibXAuYyB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL3ZpZGVv
X2JtcC5jIGIvZHJpdmVycy92aWRlby92aWRlb19ibXAuYwo+IGluZGV4IDRhZjFmYjQuLjc0MjY3
ZjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby92aWRlb19ibXAuYwo+ICsrKyBiL2RyaXZl
cnMvdmlkZW8vdmlkZW9fYm1wLmMKPiBAQCAtMjU2LDYgKzI1NiwxOSBAQCBpbnQgdmlkZW9fYm1w
X2Rpc3BsYXkoc3RydWN0IHVkZXZpY2UgKmRldiwgdWxvbmcgYm1wX2ltYWdlLCBpbnQgeCwgaW50
IHksCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAl9Cj4KCkJlbG93IHRoZXNlIGxpbmVzIHRoYXQg
eW91IGFyZSBhZGRpbmcgd2UgYWxyZWFkeSBoYXZlIGNvZGUgZm9yIGNsaXBwaW5nCmJpdG1hcHMg
dGhhdCBhcmUgdG9vIGxhcmdlOgoKICAgICAgICAgIGlmICgoeCArIHdpZHRoKSA+IHB3aWR0aCkK
ICAgICAgICAgICAgICAgICAgd2lkdGggPSBwd2lkdGggLSB4OwogICAgICAgICAgaWYgKCh5ICsg
aGVpZ2h0KSA+IHByaXYtPnlzaXplKQogICAgICAgICAgICAgICAgICBoZWlnaHQgPSBwcml2LT55
c2l6ZSAtIHk7CgpXaHkgaXMgdGhpcyBub3Qgd29ya2luZyBpbiB5b3VyIGNhc2U/CgpDbGlwcGlu
ZyBpcyBwcmVmZXJhYmxlIHRvIGNyZWF0aW5nIGVycm9yIG1lc3NhZ2VzLiBTbyBpZiBzb21ldGhp
bmcgaXMKd3JvbmcgaW4gdGhlIGNsaXBwaW5nIGxvZ2ljIHRoaXMgc2hvdWxkIGJlIGNvcnJlY3Rl
ZC4KCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCj4gKwkvKiBjaGVjayBpZiBjb29yZGluYXRlcyBl
eGNlZWRzIHBhbmVsIHNpemUgKi8KPiArCWlmIChwd2lkdGggPCB4ICYmIHggIT0gQk1QX0FMSUdO
X0NFTlRFUikgewo+ICsJCXByaW50ZigiRXJyb3I6IENvb3JkaW5hdGUgeCAlZCBpcyBiaWdnZXIg
dGhhbiBwYW5lbCB3aWR0aCAlZFxuIiwKPiArCQkgICAgICAgKGludCl4LCAoaW50KXB3aWR0aCk7
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJaWYgKHByaXYtPnlzaXplIDwgeSAm
JiB5ICE9IEJNUF9BTElHTl9DRU5URVIpIHsKPiArCQlwcmludGYoIkVycm9yOiBDb29yZGluYXRl
IHkgJWQgaXMgYmlnZ2VyIHRoYW4gcGFuZWwgaGVpZ2h0ICVkXG4iCj4gKwkJICAgICAgICwgKGlu
dCl5LCAoaW50KXByaXYtPnlzaXplKTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4g
IAlpZiAoYWxpZ24pIHsKPiAgCQl2aWRlb19zcGxhc2hfYWxpZ25fYXhpcygmeCwgcHJpdi0+eHNp
emUsIHdpZHRoKTsKPiAgCQl2aWRlb19zcGxhc2hfYWxpZ25fYXhpcygmeSwgcHJpdi0+eXNpemUs
IGhlaWdodCk7Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
