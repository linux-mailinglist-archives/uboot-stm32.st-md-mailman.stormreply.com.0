Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C928CE48
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Oct 2020 14:25:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92772C35E2B;
	Tue, 13 Oct 2020 12:25:15 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D4F2C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 12:25:14 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id B6A0D160060
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 14:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1602591913; bh=67BjfijwvXmZzQIoFRFWX4lSrHY7ZK6I8lzZMwynRiI=;
 h=Subject:To:Cc:From:Date:From;
 b=Vwr8OAlfUCrGLiKUulx2CV8vYAg+z5cIugtlrngPAL6v0RFyqK5ML4K9n36YOtgrM
 Sm3I1LMfzrOpxL4XyaPQUkZlbOGsR0HUly34bUfk7XUTp2DswL459Gi2i0TSn7DAGY
 bCN9gW1VKtoExpORItdQbbxj66Z7+6B+s2Veiwss7XSqTD8RRo1l+acYx2BhXXMTW+
 B45EhBG88rKFpJuwgi3RkXOM5Cef4JwyveNtdGPF3McLdpYFf2bew/PjsCos/BLPdI
 9Ix/5ymdmz04S07YkX6UtKZG+/vcgcHVZYhtSTRBqPRJzS92Ixv1xuSKrtcJ5ijxrO
 rLwP9Wtmt7BJg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4C9ZWD4FLlz9rxN;
 Tue, 13 Oct 2020 14:25:12 +0200 (CEST)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
References: <20201012141109.29778-1-richard.genoud@posteo.net>
 <e60dfd9cc88b45a8a2e906741d17e7df@SFHDAG2NODE3.st.com>
From: Richard Genoud <richard.genoud@posteo.net>
Message-ID: <afe44756-eea8-aa84-fc2a-903461bbf16c@posteo.net>
Date: Tue, 13 Oct 2020 14:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e60dfd9cc88b45a8a2e906741d17e7df@SFHDAG2NODE3.st.com>
Content-Language: fr-FR
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH] SPL: stm32mp1: fix spl_mmc_boot_partition
	not defined
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

SGkgUGF0cmljaywKCkxlIDEzLzEwLzIwMjAgw6AgMTQ6MTgsIFBhdHJpY2sgREVMQVVOQVkgYSDD
qWNyaXTCoDoKPiBIaSBSaWNoYXJkLAo+IAo+PiBGcm9tOiBSaWNoYXJkIEdlbm91ZCA8cmljaGFy
ZC5nZW5vdWRAcG9zdGVvLm5ldD4KPj4gU2VudDogbHVuZGkgMTIgb2N0b2JyZSAyMDIwIDE2OjEx
Cj4+Cj4+IHNwbF9tbWNfYm9vdF9wYXJ0aXRpb24gaXMgb25seSBkZWZpbmVkIHdoZW4KPj4gQ09O
RklHX1NZU19NTUNTRF9SQVdfTU9ERV9VX0JPT1RfVVNFX1BBUlRJVElPTiBpcyBkZWZpbmVkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAcG9zdGVv
Lm5ldD4KPj4gLS0tCj4+ICAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3NwbC5jIHwgMiArKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPiAKPiBSZXZpZXdlZC1ieTogUGF0
cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBzdC5jb20+Cj4gCj4gVGhhbmtzIGZvciB0
aGlzIG1pc3NpbmcgY2hlY2sgaW4gc3BsLgo+IAo+IE5COiBhZnRlciBjaGVjaywgaXQgaXMgcG9z
c2libGUgdG8gSVNfRU5BQkxFRCB0byBwcmV2ZW50ICNpZmRlZiBoZXJlCj4gCj4gPHVua25vd24+
OjA6IHdhcm5pbmc6IFVzZSAnaWYgKElTX0VOQUJMRUQoQ09ORklHLi4uKSknIGluc3RlYWQgb2Yg
JyNpZiBvciAjaWZkZWYnIHdoZXJlIHBvc3NpYmxlCgpJIGRvbid0IHRoaW5rIGl0J3MgcG9zc2li
bGUgdG8gdXNlICJpZiAoSVNfRU5BQkxFRChDT05GSUcuLi4pKSIKc2luY2Ugd2UgaGF2ZSB0byBy
ZW1vdmUgdGhlIHdob2xlIGZ1bmN0aW9uLCBub3QganVzdCBzb21lIGNvZGUgaW4gaXQuCgpSZWdh
cmRzLApSaWNoYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3Vib290LXN0bTMyCg==
