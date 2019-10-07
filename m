Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D93CE3A1
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 15:29:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6394FC36B10
	for <lists+uboot-stm32@lfdr.de>; Mon,  7 Oct 2019 13:29:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35790C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Oct 2019 13:29:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x97DL4wQ028821; Mon, 7 Oct 2019 15:29:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=gRwGr+x3dt3Y2OvimqI89FXXncMv3K0CelLij9pvaZg=;
 b=ysiMNITjIkAruQ0I4nDFHAVErWSUVDKymK5W86jE+OsP3uM2rnCV9clXSrFtCvz5Agsq
 4iHdBSC1q+4RSQH8UqvTXiDoSat0lxAoAEwZd2czNVIB7chnLGIJP/Dbjw4Ct52jfbbw
 tKzC4fp7klqGYFCaQIjhx49Nqjye8T8raO8FLDyaIamhc/Vl+WtjnkC2zLISzdCzLEA1
 dG8qf3zduxOX6mkjOzVwDfPhG1Tt4ymCl/lg9gwnZ1yfRwkVzuYryTUpPhK7misVuKzL
 7/4gmtvrimycVviSQhTlKEee3PRYgcyo3EtyzP1kmSD5KB7axbGiY/Z+k1y30BJFReqb nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vegn0jktj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Oct 2019 15:29:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BFBC100034;
 Mon,  7 Oct 2019 15:29:26 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4659C2BFDF5;
 Mon,  7 Oct 2019 15:29:26 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019
 15:29:26 +0200
Received: from localhost (10.201.23.97) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 7 Oct 2019 15:29:25
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Vikas Manocha <vikas.manocha@st.com>, Benjamin Gaignard
 <benjamin.gaignard@st.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Jens Wiklander <jens.wiklander@linaro.org>, "Eugen
 Hristev" <eugen.hristev@microchip.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 <u-boot@lists.denx.de>, <uboot-stm32@st-md-mailman.stormreply.com>
Date: Mon, 7 Oct 2019 15:29:00 +0200
Message-ID: <1570454955-21298-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-07_02:2019-10-07,2019-10-07 signatures=0
Subject: [Uboot-stm32] [PATCH v5 00/15] splash screen on the stm32f769 &
	stm32mp1 boards
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

VmVyc2lvbiAxOgotIEluaXRpYWwgY29tbWl0LgoKVmVyc2lvbiAyOgotIHN3YXAgcGF0Y2hlcyB0
byBhdm9pZCBjb21waWxhdGlvbiBpc3N1ZS4KLSByZW1vdmUgcGFuZWwgdGltaW5ncyBmcm9tIGRl
dmljZSB0cmVlLgoKVmVyc2lvbiAzOgotIFNoYXJlIHNhbWUgaW5jbHVkZSBmaWxlIG1pcGlfZGlz
cGxheS5oIHdpdGgga2VybmVsIGxpbnV4LgotIFJld29yayBsdGRjIGRyaXZlciB3aXRoIGxhc3Qg
Y29tbWVudHMgb2YgQW5hdG9saWogR3VzdHNoaW4uCi0gQ2hlY2sgb3JkZXJpbmcgKGZpbGUgZHdf
bWlwaV9kc2kuYykuCi0gUmVuYW1lIG1pcGlfZGlzcGxheS5jIHRvIG1pcGlfZHNpLmMuCgpWZXJz
aW9uIDQ6Ci0gQWRkIHBoeXNpY2FsIHNldCBtb2RlIG9wZXJhdGlvbgotIEltcHJvdmUgZGVidWcg
dHJhY2UgKGRpc3BsYXkgY29udHJvbGxlciBsdGRjKQotIFJlZnJlc2ggdGltaW5ncyBvZiBwYW5l
bHMKLSBBZGQgcmVndWxhdG9yIChkc2kgY29udHJvbGxlcikKLSBBZGQgbmV3IGNsYXNzIERTSV9I
T1NUCi0gU3VwcG9ydCBvZiBwYW5lbHMgT1RNODAwQSAmIFJNNjgyMDAKClZlcnNpb24gNToKLSBS
ZXdvcmsgZHNpIGhvc3QgcGF0Y2ggd2l0aCBsYXN0IGNvbW1lbnRzIG9mIFNpbW9uIEdsYXNzLgoK
VGhpcyBzZXJpZSBjb250YWlucyBhbGwgcGF0Y2hzZXRzIG5lZWRlZCBmb3IgZGlzcGxheWluZyBh
IHNwbGFzaCBzY3JlZW4Kb24gdGhlIHN0bTMyZjc2OSAmIHN0bTMybXAxIGJvYXJkcy4KQSBuZXcg
Y29uZmlnIGhhcyBiZWVuIGNyZWF0ZWQgY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmln
LgpUaGlzIGlzIG5lY2Vzc2FyeSBkdWUgdG8gdGhlIGRpZmZlcmVuY2Ugb2YgcGFuZWxzIGJldHdl
ZW4gc3RtMzJmNzY5LWRpc2NvLApzdG0zMmY3NDYtZGlzY28gYm9hcmRzICYgc3RtMzJtcDEgYm9h
cmRzLgpBIG5ldyBjbGFzcyBEU0lfSE9TVCBoYXZlIGJlZW4gY3JlYXRlZCB0byBtYW5hZ2UgYSBk
c2kgaG9zdCBiZXR3ZWVuIHRoZQpkc2kgY29udHJvbGxlciAmIGRpc3BsYXkgY29udHJvbGxlci4K
Cllhbm5pY2sgRmVydHLDqSAoMTUpOgogIHZpZGVvOiBibXA6IGNoZWNrIHJlc29sdXRpb25zIG9m
IHBhbmVsL2JpdG1hcAogIHZpZGVvOiBzdG0zMjogc3RtMzJfbHRkYzogYWRkIGJyaWRnZSB0byBk
aXNwbGF5IGNvbnRyb2xsZXIKICBpbmNsdWRlOiBBZGQgbmV3IERDUyBjb21tYW5kcyBpbiB0aGUg
ZW51bSBsaXN0CiAgdmlkZW86IGFkZCBzdXBwb3J0IG9mIE1JUEkgRFNJIGludGVyZmFjZQogIGRt
OiBBZGQgYSBkc2kgaG9zdCB1Y2xhc3MKICB2aWRlbzogYWRkIE1JUEkgRFNJIGhvc3QgY29udHJv
bGxlciBicmlkZ2UKICB2aWRlbzogYWRkIHN1cHBvcnQgb2YgU1RNMzIgTUlQSSBEU0kgY29udHJv
bGxlciBkcml2ZXIKICB2aWRlbzogYWRkIHN1cHBvcnQgb2YgcGFuZWwgT1RNODAwOUEKICB2aWRl
bzogYWRkIHN1cHBvcnQgb2YgcGFuZWwgUk02ODIwMAogIGJvYXJkOiBBZGQgU1RNMzJGNzY5IFNv
QywgZGlzY292ZXJ5IGJvYXJkIHN1cHBvcnQKICBBUk06IGR0czogc3RtMzJmNzY5OiBhZGQgZGlz
cGxheSBmb3IgU1RNMzJGNzY5IGRpc2NvIGJvYXJkCiAgQVJNOiBkdHM6IHN0bTMybXAxOiBhZGQg
ZHNpIGhvc3QgZm9yIHN0bTMybXAxNTdjLWV2MSBib2FyZAogIEFSTTogZHRzOiBzdG0zMm1wMTog
YWRkIGRzaSBob3N0IGZvciBzdG0zMm1wMTU3Yy1kazIgYm9hcmQKICBzdG0zMm1wMTogY29uZmln
czogdXBkYXRlIHZpZGVvCiAgc3RtMzJtcDE6IGNvbmZpZ3M6IGFkZCBkaXNwbGF5IGRldmljZXMK
CiBhcmNoL2FybS9kdHMvc3RtMzJmNzY5LWRpc2NvLXUtYm9vdC5kdHNpIHwgIDYyICsrKwogYXJj
aC9hcm0vZHRzL3N0bTMybXAxNTdjLWRrMi11LWJvb3QuZHRzaSB8ICAgNyArCiBhcmNoL2FybS9k
dHMvc3RtMzJtcDE1N2MtZXYxLXUtYm9vdC5kdHNpIHwgICA1ICsKIGFyY2gvc2FuZGJveC9kdHMv
c2FuZGJveC5kdHMgICAgICAgICAgICAgfCAgIDYgKy0KIGNvbmZpZ3Mvc2FuZGJveF9kZWZjb25m
aWcgICAgICAgICAgICAgICAgfCAgIDEgKwogY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29u
ZmlnICAgICAgICB8ICA2MyArKysKIGNvbmZpZ3Mvc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyAg
ICAgICAgfCAgIDYgKwogY29uZmlncy9zdG0zMm1wMTVfb3B0ZWVfZGVmY29uZmlnICAgICAgICB8
ICAgNiArCiBjb25maWdzL3N0bTMybXAxNV90cnVzdGVkX2RlZmNvbmZpZyAgICAgIHwgICA2ICsK
IGRyaXZlcnMvdmlkZW8vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgNDcgKysKIGRyaXZl
cnMvdmlkZW8vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogZHJpdmVycy92aWRl
by9kc2ktaG9zdC11Y2xhc3MuYyAgICAgICAgICB8ICAzOSArKwogZHJpdmVycy92aWRlby9kd19t
aXBpX2RzaS5jICAgICAgICAgICAgICB8IDgzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiBkcml2ZXJzL3ZpZGVvL21pcGlfZHNpLmMgICAgICAgICAgICAgICAgIHwgODI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy92aWRlby9vcmlzZXRlY2hfb3RtODAw
OWEuYyAgICAgICB8IDM3OSArKysrKysrKysrKysrKwogZHJpdmVycy92aWRlby9yYXlkaXVtLXJt
NjgyMDAuYyAgICAgICAgICB8IDM1MSArKysrKysrKysrKysrCiBkcml2ZXJzL3ZpZGVvL3NhbmRi
b3hfZHNpX2hvc3QuYyAgICAgICAgIHwgIDkwICsrKysKIGRyaXZlcnMvdmlkZW8vc3RtMzIvS2Nv
bmZpZyAgICAgICAgICAgICAgfCAgIDkgKwogZHJpdmVycy92aWRlby9zdG0zMi9NYWtlZmlsZSAg
ICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5jICAgICAg
ICAgIHwgNDkwICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9s
dGRjLmMgICAgICAgICB8IDE0MyArKystLS0KIGRyaXZlcnMvdmlkZW8vdmlkZW9fYm1wLmMgICAg
ICAgICAgICAgICAgfCAgIDcgKwogaW5jbHVkZS9jb25maWdzL3N0bTMybXAxLmggICAgICAgICAg
ICAgICB8ICAgNyArCiBpbmNsdWRlL2RtL3VjbGFzcy1pZC5oICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKIGluY2x1ZGUvZHNpX2hvc3QuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgNzMgKysr
CiBpbmNsdWRlL21pcGlfZGlzcGxheS5oICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIGluY2x1
ZGUvbWlwaV9kc2kuaCAgICAgICAgICAgICAgICAgICAgICAgfCA0NjYgKysrKysrKysrKysrKysr
KysKIHRlc3QvZG0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogdGVz
dC9kbS9kc2lfaG9zdC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA1OCArKysKIDI5IGZpbGVz
IGNoYW5nZWQsIDM5NDMgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgY29uZmlncy9zdG0zMmY3NjktZGlzY29fZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy92aWRlby9kc2ktaG9zdC11Y2xhc3MuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvdmlkZW8vZHdfbWlwaV9kc2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
dmlkZW8vbWlwaV9kc2kuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vb3Jpc2V0
ZWNoX290bTgwMDlhLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL3JheWRpdW0t
cm02ODIwMC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9zYW5kYm94X2RzaV9o
b3N0LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL3N0bTMyL3N0bTMyX2RzaS5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kc2lfaG9zdC5oCiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9taXBpX2RzaS5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdC9kbS9kc2lfaG9z
dC5jCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
