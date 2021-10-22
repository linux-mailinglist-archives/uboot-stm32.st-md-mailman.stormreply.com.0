Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D00437E95
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 21:25:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B199C5C85D;
	Fri, 22 Oct 2021 19:25:06 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37CCBC5C85A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 19:25:05 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id 57D88140E72;
 Fri, 22 Oct 2021 21:25:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1634930704; bh=Gt1j8Q6Joh/BdZ2LTGhT+Dg8rgpwrxe4QczGa3Dv68A=;
 h=Date:From:To;
 b=pUophFJSKw9H5xHGmCI9BV1RjIEClMWwu8L76/c8oC52hWrEjoo9zcGRsixcUq7iV
 m8P0OtZ7wuOpQJ40zDpHmHtCS+UuSvRk281P1uYqCzSataXmiPte16bWY+XtcCT3Hd
 4Hlxl7TBWsQ01xtMEEPtzGoPK70OzFcldXUDgZ74=
Date: Fri, 22 Oct 2021 21:25:03 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20211022212503.087dd056@thinkpad>
In-Reply-To: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
References: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT, URIBL_BLOCKED,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.4 at mail
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] Question: LTO and failing objcopy in
 "u-boot-initial-env" target
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

T24gRnJpLCAyMiBPY3QgMjAyMSAxNzoxNjoxOCArMDIwMApQYXRyaWNrIERFTEFVTkFZIDxwYXRy
aWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3cm90ZToKCj4gSGksCj4gCj4gCj4gSSBtYWRlIHRl
c3RzIHdpdGggTFRPIG9wdGlvbiBhY3RpdmF0ZWQgb24gc3RtMzJtcDE1IGJvYXJkcyBidXQgaWYg
aGF2ZSBhIAo+IGlzc3VlCj4gCj4gd2l0aCB0aGUgVS1Cb290IHRhcmdldMKgICJ1LWJvb3QtaW5p
dGlhbC1lbnYiICh0aGlzIGNvbW1hbmQgdXNlZCBieSBZT0NUTykKPiAKPiAKPiAkPiBtYWtlIHUt
Ym9vdC1pbml0aWFsLWVudiAgCj4gCj4gLi4uCj4gCj4gR0VORU5WwqAgdS1ib290LWluaXRpYWwt
ZW52Cj4gYXJtLW5vbmUtbGludXgtZ251ZWFiaWhmLW9iamNvcHk6IGVudi9jb21tb24ubzogY2Fu
J3QgZHVtcCBzZWN0aW9uIAo+ICcucm9kYXRhLmRlZmF1bHRfZW52aXJvbm1lbnQnIC0gaXQgZG9l
cyBub3QgZXhpc3Q6IGZpbGUgZm9ybWF0IG5vdCAKPiByZWNvZ25pemVkCj4gc2VkOiBjYW4ndCBy
ZWFkIHUtYm9vdC1pbml0aWFsLWVudjogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+IG1ha2Vb
MV06ICoqKiBbL2xvY2FsL2hvbWUvZnJxMDc2MzIvdmlld3MvdS1ib290L01ha2VmaWxlOjIzMTU6
IAo+IHUtYm9vdC1pbml0aWFsLWVudl0gRXJyb3IgMgo+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0
b3J5IAo+ICcvbG9jYWwvaG9tZS9mcnEwNzYzMi92aWV3cy9idWlsZC9zdG0zMm1wMTVfZGVmY29u
ZmlnJwo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTc3OiBzdWItbWFrZV0gRXJyb3IgMgo+IAo+IAo+
IEJ1dCBJIHJlcHJvZHVjZWQgaXQgd2l0aCBzYW5kYm94Ogo+IAo+ICQ+IG1ha2Ugc2FuZGJveF9k
ZWZjb25maWcgIAo+IAo+ICQ+IG1ha2UgYWxsICAKPiAKPiAkPiBtYWtlIHUtYm9vdC1pbml0aWFs
LWVudiAgCj4gCj4gLi4uLgo+IAo+ICDCoCBMVE/CoMKgwqDCoCB1LWJvb3QKPiAgwqAgT0JKQ09Q
WSB1LWJvb3Qtbm9kdGIuYmluCj4gIMKgIENPUFnCoMKgwqAgdS1ib290LmJpbgo+ICDCoCBHRU5F
TlbCoCB1LWJvb3QtaW5pdGlhbC1lbnYKPiBvYmpjb3B5OiBlbnYvY29tbW9uLm86IGNhbid0IGR1
bXAgc2VjdGlvbiAnLnJvZGF0YS5kZWZhdWx0X2Vudmlyb25tZW50JyAKPiAtIGl0IGRvZXMgbm90
IGV4aXN0OiBmaWxlIGZvcm1hdCBub3QgcmVjb2duaXplZAo+IHNlZDogY2FuJ3QgcmVhZCB1LWJv
b3QtaW5pdGlhbC1lbnY6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBtYWtlOiAqKiogW01h
a2VmaWxlOjIzMTU6IHUtYm9vdC1pbml0aWFsLWVudl0gRXJyb3IgMgo+IAo+IAo+IAo+IERvIHlv
dSBhbHJlYWR5IGtub3cgdGhpcyBpc3N1ZSBmb3Igb3RoZXIgYm9hcmQgd2hpY2ggYWN0aXZhdGUg
dGhlIExUTyAKPiBmZWF0dXJlID8KPiAKPiBJIGRvbid0IHNlZSBhbnkgcmVtYXJrcyBhYm91dCB0
aGlzIGlzc3VlIG9uIG1haWxpbmcgbGlzdC4KPiAKPiBUb2RheSBJIGFtIGtub3duIGhvdyB0byBz
b2x2ZSB0aGlzIGlzc3VlLgo+IAo+IAo+IFBTOiBUaGUgc2FtZSBjb21tYW5kIGlzIGV4ZWN1dGVk
IGluICJzY3JpcHRzL2dldF9kZWZhdWx0X2VudnMuc2giCgpTZWVtcyB0aGF0IHRoYXQgc2NyaXB0
IGlzbid0IGV4ZWN1dGVkIGluIGNvZGUgaW50ZWdyYXRpb24sIG90aGVyd2lzZSBJCndvdWxkIGhh
dmUgbm90aWNlZCB0aGlzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
