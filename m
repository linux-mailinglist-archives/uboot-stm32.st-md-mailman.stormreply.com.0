Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB423647118
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Dec 2022 14:55:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D920C65067;
	Thu,  8 Dec 2022 13:55:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E4E2C6411C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Dec 2022 13:55:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7E35F817FB;
 Thu,  8 Dec 2022 14:55:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670507715;
 bh=eaohQgrJCJ0T4Dcbm6T7FKhtc0ZgTeJWJWrC3Irm5yM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hVTaSf+Wsr8aakjmsfjo3Ms8brVU/DA3fA+efw4bczTQc/A/baksNAa8HKVzBqRT+
 vujO2Q+KobuRCVrTV/1ekNihfIJgH161+jW0rzigjWCFAdpYNY0anIEb7IcnAzcxm0
 r70FNiDe2wBw3/oef15ww7X8hZ+XaKVqHqyIoIdgbh3IXwJURHta7KzIHTLDUL8Umc
 2Pwc2rjEuDR+bSBIWQVnBuR1OD66lKy7eXK77ZuPY+pWGZ6wNxhPAwVN+Ber2YSCE5
 qdIQaH8c2VIWxfTlgVbLHIPDumca2JfIR//0VCZPH7/L2goC7dxSrDJ/5Na21CI9TE
 6my0GplSzawZQ==
Message-ID: <a868016a-e9cd-e47a-ccc1-6588686ea6c5@denx.de>
Date: Thu, 8 Dec 2022 14:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
 <0a41cbe2-8f9f-4ba9-5ffc-e1047d0e37c8@denx.de>
 <6c8b6387-17bf-a4d1-8c75-d9cfdf512351@foss.st.com>
 <a50b41c6-b6e9-4a9d-9995-d7e3baf412ce@denx.de>
 <35330e71-f6d5-7a05-c1a9-51e3b9ecc488@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <35330e71-f6d5-7a05-c1a9-51e3b9ecc488@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] dfu: Make DFU virtual backend SPL friendly
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

T24gMTIvOC8yMiAxNDo1MywgUGF0cmljZSBDSE9UQVJEIHdyb3RlOgo+IAo+IAo+IE9uIDEyLzgv
MjIgMTQ6MjcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiAxMi84LzIyIDA5OjE5LCBQYXRyaWNl
IENIT1RBUkQgd3JvdGU6Cj4+PiBIaSBNYXJlawo+Pgo+PiBIZWxsbyBQYXRyaWNlLAo+Pgo+Pj4g
SSBhbSBwcmVwYXJpbmcgYSBTVE0zMiBwdWxsIHJlcXVlc3Qgd2hpY2ggaW5jbHVkZXMgdGhpcyBz
ZXJpZXMKPj4+Cj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvdWJvb3Qv
cGF0Y2gvMjAyMjEyMDYwMjM1MTUuMTEzNTU2LTEtbWFyZXhAZGVueC5kZS8KPj4+Cj4+PiBXZSBn
b3QgYSBERlUgY29tcGlsYXRpb24gaXNzdWUgd2l0aCB0aGlzIHNlcmllcyA6Cj4+Pgo+Pj4gIMKg
wqDCoMKgwqDCoMKgIGFybTrCoCArwqDCoCBzdG0zMm1wMTVfZGhjb21fYmFzaWMKPj4+ICsvdXNy
L2xpYi9weXRob24zL2Rpc3QtcGFja2FnZXMvc2V0dXB0b29scy9kaXN0LnB5OjQ3MzogVXNlcldh
cm5pbmc6IE5vcm1hbGl6aW5nICcyMDIzLjAxJyB0byAnMjAyMy4xJwo+Pj4gK8KgIHdhcm5pbmdz
Lndhcm4oCj4+PiArYXJtLWxpbnV4LWdudWVhYmktbGQuYmZkOiBkcml2ZXJzL2RmdS9kZnUubzog
aW4gZnVuY3Rpb24gYGRmdV9maWxsX2VudGl0eSc6Cj4+PiArZHJpdmVycy9kZnUvZGZ1LmM6NTQ4
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkZnVfZmlsbF9lbnRpdHlfdmlydCcKPj4+ICttYWtl
WzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuc3BsOjUyNzogc3BsL3UtYm9vdC1zcGxdIEVycm9y
IDEKPj4+ICttYWtlWzFdOiAqKiogW01ha2VmaWxlOjIwNzE6IHNwbC91LWJvb3Qtc3BsXSBFcnJv
ciAyCj4+PiArbWFrZTogKioqIFtNYWtlZmlsZToxNzc6IHN1Yi1tYWtlXSBFcnJvciAyCj4+PiAg
wqDCoMKgwqDCoMKgwqAgYXJtOsKgICvCoMKgIHN0bTMybXAxNV9kaGNvcl9iYXNpYwo+Pj4gKy91
c3IvbGliL3B5dGhvbjMvZGlzdC1wYWNrYWdlcy9zZXR1cHRvb2xzL2Rpc3QucHk6NDczOiBVc2Vy
V2FybmluZzogTm9ybWFsaXppbmcgJzIwMjMuMDEnIHRvICcyMDIzLjEnCj4+PiArwqAgd2Fybmlu
Z3Mud2FybigKPj4+ICthcm0tbGludXgtZ251ZWFiaS1sZC5iZmQ6IGRyaXZlcnMvZGZ1L2RmdS5v
OiBpbiBmdW5jdGlvbiBgZGZ1X2ZpbGxfZW50aXR5JzoKPj4+ICtkcml2ZXJzL2RmdS9kZnUuYzo1
NDg6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRmdV9maWxsX2VudGl0eV92aXJ0Jwo+Pj4gK21h
a2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5zcGw6NTI3OiBzcGwvdS1ib290LXNwbF0gRXJy
b3IgMQo+Pj4gK21ha2VbMV06ICoqKiBbTWFrZWZpbGU6MjA3MTogc3BsL3UtYm9vdC1zcGxdIEVy
cm9yIDIKPj4+ICttYWtlOiAqKiogW01ha2VmaWxlOjE3Nzogc3ViLW1ha2VdIEVycm9yIDIKPj4+
Cj4+Pgo+Pj4gVGhlIGNvcnJlY3QgZml4IGlzIHRoaXMgcGF0Y2ggYmVsb3cgd2hpY2ggaXMgY3Vy
cmVudGx5IGluIHlvdXIgdXNiL21hc3RlciBicmFuY2guCj4+PiBJIHByb3Bvc2UgdG8gdGFrZSB0
aGlzIHBhdGNoIGluIG15IHB1bGwgcmVxdWVzdCAoYXZhaWxhYmxlIHRvZGF5IG9yIHRvbW9ycm93
KSB0byBtYWtlIEdpdExhYiBDaSB0ZXN0cyBoYXBweS4KPj4+Cj4+PiBBcmUgeW91IE9LID8KPj4K
Pj4gSSBzdGlsbCBoYXZlIG9uZSBtb3JlIHBhdGNoIHRvIHBpY2svcmV2aWV3IGFuZCB0aGVuIEkn
bGwgc2VuZCBVU0IgTVIuCj4+IEkgY2FuIGFzayBUb20gdG8gcGljayBpdCBiZWZvcmUgdGhlIFNU
TSBNUiBhdCB3aGljaCBwb2ludCBpdCBzaG91bGQgYWxsIGJlIGZpbmUgPwo+IAo+IE9rLCBwZXJm
ZWN0Lgo+IEkgd2lsbCBwdXQgYW4gYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBpbmRpY2F0aW5nIHRo
ZSBkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGUgU1RNMzIgcHVsbCByZXF1ZXN0IGFuZCB0aGUgVVNC
IG9uZS4KClRoYW5rIHlvdS4KClRoZSBVU0IgTVIgaXMgbm93IGluIHRoZSBDSS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qtc3RtMzIgbWFpbGlu
ZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIK
